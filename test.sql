-- Users --
	create table users(
		user_id bigint unsigned auto_increment,
		username varchar(32) not null,
		password varchar(255) not null,
		email varchar(255),
		phone_number varchar(32),
		qq_number varchar(255),
		gender smallint(1) unsigned comment '1 stands for male, 0 stands for female',
		partner_id bigint(32) unsigned comment 'current user\'s partner id',
		given_name varchar(255),
		family_name varchar(255),
		id_card_number varchar(32),
		birth_date bigint(12) unsigned comment 'user\'s bithdate (unix timestamp)',
		signup_time bigint(12) unsigned comment 'user\'s signup time unix timestamp',
		last_login_time bigint(12) unsigned,
		email_verify_code varchar(255) comment 'use for identify user when submit signup',
		wedding_anniversary date comment 'user\'s wedding anniversary date',
		default_address_id smallint unsigned comment 'user\'s default_address id',
		is_admin smallint unsigned default '0' comment 'whether current user using admin account',
		visible smallint unsigned default '1' comment 'whether user account is frozen',
		last_modify_time bigint not null,
		primary key (user_id),
		unique ui_username (username),
		unique ui_id_card_number (id_card_number),
		index i_phone_number(phone_number)
	) engine = innodb charset = utf8;

	create table users_types(
		type_id smallint unsigned auto_increment,
		type_name varchar(255) not null,
		--
		visible smallint unsigned default '1',
		create_time bigint unsigned not null,
		last_modify_time bigint unsigned not null,
		creator_id bigint unsigned not null,
		last_modifier_id bigint unsigned not null,
		primary key (type_id),
		--
		constraint fk_users_types_creator_id
			foreign key (creator_id)
				references users (user_id)
				on update cascade
				on delete cascade,
		constraint fk_users_types_last_modifier_id
			foreign key (last_modifier_id) 
				references users (user_id)
				on update cascade
				on delete cascade
	) engine = innodb charset = utf8;
	alter table users_types add index ui_type_name (type_name);

	create table rt_users_partners(
		partner_id int(255) unsigned auto_increment primary key comment 'user\'s partner\'s id',
		user_id bigint unsigned comment 'user\'s id',
		given_name varchar(255),
		family_name varchar(255),
		id_card_number varchar(32),
		birth_date bigint(12) unsigned comment 'user\'s bithdate (unix timestamp)',
		phone_number varchar(32),
		qq_number varchar(255),
		visible smallint unsigned default '1',
		--
		create_time bigint unsigned not null,
		last_modify_time bigint unsigned not null,
		creator_id bigint unsigned not null,
		last_modifier_id bigint unsigned not null,
		constraint fk_rt_users_partners_user_id 
			foreign key (user_id) 
				references users (user_id)
				on update cascade
				on delete cascade,
		--
		constraint fk_rt_users_partners_creator_id
			foreign key (creator_id) 
				references users (user_id)
				on update cascade
				on delete cascade,
		constraint fk_rt_users_partners_last_modifier_id
			foreign key (last_modifier_id) 
				references users (user_id)
				on update cascade
				on delete cascade,
		unique ui_id_card_number (id_card_number),
		index i_phone_number (phone_number),
		index i_qq_number (qq_number)
	) engine = innodb charset = utf8;

	create table rt_users_wish_items(
		r_id bigint unsigned auto_increment,
		user_id bigint unsigned not null,
		product_id bigint unsigned not null,
		visible smallint unsigned default '1',
		--
		create_time bigint unsigned not null,
		last_modify_time bigint unsigned not null,
		creator_id bigint unsigned not null,
		last_modifier_id bigint unsigned not null,
		primary key (r_id),
		constraint fk_rt_users_wish_item_user_id 
			foreign key (user_id)
				references users(user_id)
				on update cascade
				on delete cascade,
		constraint fk_rt_users_wish_item_product_id 
			foreign key (product_id)
				references products(product_id)
				on update cascade
				on delete cascade,
		--
		constraint fk_rt_users_wish_items_creator_id
			foreign key (creator_id) 
				references users (user_id)
				on update cascade
				on delete cascade,
		constraint fk_rt_users_wish_items_modifier
			foreign key (last_modifier_id)
				references users (user_id)
				on update cascade
				on delete cascade,
		unique ui_users_wish_items_pair (user_id, product_id)
	) engine = innodb charset = utf8;

	create table rt_users_addresses(
		r_id bigint unsigned auto_increment,
		user_id bigint unsigned not null,
		province varchar(32),
		city varchar(32),
		county varchar(32),
		detail text,
		is_default smallint(1) unsigned not null,
		visible smallint unsigned default '1',
		--
		create_time bigint unsigned not null,
		last_modify_time bigint unsigned not null,
		creator_id bigint unsigned not null,
		last_modifier_id bigint unsigned not null,
		primary key (r_id),
		constraint fk_rt_users_address_user_id 
			foreign key (user_id) 
				references users(user_id) 
				on update cascade 
				on delete cascade,
		constraint fk_rt_users_addresses_creator_id
			foreign key (creator_id) 
				references users (user_id)
				on update cascade
				on delete cascade,
		constraint fk_rt_users_addresses_last_modifier_id
			foreign key (last_modifier_id)
				references users (user_id)
				on update cascade
				on delete cascade,
		index i_province (province),
		index i_city (city)
	) engine = innodb charset = utf8;


	create table rt_users_types(
		r_id bigint unsigned auto_increment,
		type_id smallint unsigned not null,
		user_id bigint unsigned not null,
		--
		visible smallint unsigned default '1',
		create_time bigint unsigned not null,
		last_modify_time bigint unsigned not null,
		creator_id bigint unsigned not null,
		last_modifier_id bigint unsigned not null,
		primary key (r_id),
		constraint fk_rt_users_types_user_id 
			foreign key (user_id) 
				references users(user_id) 
				on update cascade 
				on delete cascade,
		constraint fk_rt_users_types_type_id
			foreign key (type_id)
				references users_types (type_id)
				on update cascade 
				on delete cascade,
		--
		constraint fk_rt_users_types_creator_id
			foreign key (creator_id) 
				references users (user_id)
				on update cascade
				on delete cascade,
		constraint fk_rt_users_types_last_modifier_id
			foreign key (last_modifier_id) 
				references users (user_id)
				on update cascade
				on delete cascade,
		unique i_type_id (type_id)
	) engine = innodb charset = utf8;



	create table rt_users_shopping_cart_items (
		r_id bigint unsigned auto_increment,
		user_id bigint unsigned not null,
		product_id bigint unsigned not null,
		visible smallint unsigned default '1',
		--
		create_time bigint unsigned not null,
		last_modify_time bigint unsigned not null,
		creator_id bigint unsigned not null,
		last_modifier_id bigint unsigned not null,
		primary key (r_id),
		constraint fk_rt_users_shopping_cart_item_user_id 
			foreign key (user_id) 
				references users(user_id)
				on update cascade
				on delete cascade,
		constraint fk_rt_users_shopping_cart_item_product_id
			foreign key (product_id)
				references products(product_id)
				on update cascade
				on delete cascade,
		constraint fk_rt_users_shopping_cart_items_creator_id
			foreign key (creator_id) 
				references users (user_id)
				on update cascade
				on delete cascade,
		constraint fk_rt_users_shopping_cart_items_last_modifier_id
			foreign key (last_modifier_id) 
				references users (user_id)
				on update cascade
				on delete cascade
	) engine = innodb charset = utf8;

	create table rt_admin_users(
		r_id bigint unsigned auto_increment,
		user_id bigint unsigned not null,
		permission_level smallint not null,
		visible smallint unsigned default '1',
		--
		create_time bigint unsigned not null,
		last_modify_time bigint unsigned not null,
		creator_id bigint unsigned not null,
		last_modifier_id bigint unsigned not null,
		primary key (r_id),
		constraint fk_rt_admin_user_user_id
			foreign key (user_id)
			references users(user_id)
			on update cascade
			on delete cascade,
		constraint fk_rt_admin_users_creator_id
			foreign key (creator_id) 
				references users (user_id)
				on update cascade
				on delete cascade,
		constraint fk_rt_admin_users_last_modifier_id
			foreign key (last_modifier_id) 
				references users (user_id)
				on update cascade
				on delete cascade
	) engine = innodb charset = utf8;
-- Users End --



-- Products --
	create table products(
		product_id bigint unsigned auto_increment primary key comment 'product id',
		specified_id varchar(32) not null comment 'sufix of product category (product number)',
		color varchar(32) not null,
		peice_weight int,
		substance varchar(32),
		visible smallint unsigned default '1',
		--
		create_time bigint unsigned not null,
		last_modify_time bigint unsigned not null,
		creator_id bigint unsigned not null,
		last_modifier_id bigint unsigned not null,
		constraint fk_products_creator_id
			foreign key (creator_id) 
				references users (user_id)
				on update cascade
				on delete cascade,
		constraint fk_products_last_modifier_id
			foreign key (last_modifier_id) 
				references users (user_id)
				on update cascade
				on delete cascade
	) engine = innodb charset = utf8;

	-- this table specifies all the types of craft typem,
	-- this table could only be affected by admin.
	create table craft_types( 
		craft_type_id smallint unsigned not null auto_increment,
		craft_type varchar(32) not null,
		price int not null,
		could_be_customized smallint not null,
		visible smallint unsigned default '1',
		--
		create_time bigint unsigned not null,
		last_modify_time bigint unsigned not null,
		creator_id bigint unsigned not null,
		last_modifier_id bigint unsigned not null,
		primary key (craft_type_id),
		constraint fk_craft_types_creator_id
			foreign key (creator_id) 
				references users (user_id)
				on update cascade
				on delete cascade,
		constraint fk_craft_types_last_modifier_id
			foreign key (last_modifier_id) 
				references users (user_id)
				on update cascade
				on delete cascade
	) engine = innodb charset = utf8;

	-- this table specifies all the types of product tags,
	-- this table could only be affected by admin.
	create table tags(
		tag_id smallint unsigned not null auto_increment,
		tag_title varchar(64) not null,
		visible smallint unsigned default '1',
		--
		create_time bigint unsigned not null,
		last_modify_time bigint unsigned not null,
		creator_id bigint unsigned not null,
		last_modifier_id bigint unsigned not null,
		primary key (tag_id),
		constraint fk_tags_creator_id
			foreign key (creator_id) 
				references users (user_id)
				on update cascade
				on delete cascade,
		constraint fk_tags_last_modifier_id
			foreign key (last_modifier_id) 
				references users (user_id)
				on update cascade
				on delete cascade
	) engine = innodb charset = utf8;

	-- this table specifies all the types of product brands,
	-- this table could only be affected by admin.
	create table brands(
		brand_id smallint unsigned not null auto_increment,
		brand_name varchar(64) not null,
		visible smallint unsigned default '1',
		--
		create_time bigint unsigned not null,
		last_modify_time bigint unsigned not null,
		creator_id bigint unsigned not null,
		last_modifier_id bigint unsigned not null,
		primary key (brand_id),
		constraint fk_brands_creator_id
			foreign key (creator_id) 
				references users (user_id)
				on update cascade
				on delete cascade,
		constraint fk_brands_last_modifier_id
			foreign key (last_modifier_id) 
				references users (user_id)
				on update cascade
				on delete cascade
	) engine = innodb charset = utf8;

	-- this table specifies all the types of product discounts,
	-- this table could only be affected by admin.
	create table discounts(
		discount_type_id smallint unsigned not null auto_increment,
		discount_type varchar(64) not null,
		discount double not null,
		visible smallint unsigned default '1',
		--
		create_time bigint unsigned not null,
		last_modify_time bigint unsigned not null,
		creator_id bigint unsigned not null,
		last_modifier_id bigint unsigned not null,
		primary key (discount_type_id),
		constraint fk_discounts_creator_id
			foreign key (creator_id) 
				references users (user_id)
				on update cascade
				on delete cascade,
		constraint fk_discounts_last_modifier_id
			foreign key (last_modifier_id) 
				references users (user_id)
				on update cascade
				on delete cascade
	) engine = innodb charset = utf8;

	-- this table specifies all the types of photos,
	-- this table could only be affected by admin.
	create table photo_types(
		type_id int unsigned not null auto_increment,
		type varchar(64) not null,
		width int unsigned not null,
		height int unsigned not null,
		visible smallint unsigned default '1',
		--
		create_time bigint unsigned not null,
		last_modify_time bigint unsigned not null,
		creator_id bigint unsigned not null,
		last_modifier_id bigint unsigned not null,
		primary key (type_id),
		constraint fk_photo_types_creator_id
			foreign key (creator_id) 
				references users (user_id)
				on update cascade
				on delete cascade,
		constraint fk_photo_types_last_modifier_id
			foreign key (last_modifier_id) 
				references users (user_id)
				on update cascade
				on delete cascade
	) engine = innodb charset = utf8;

	create table description_types(
		type_id int unsigned auto_increment,
		type_name varchar(255) not null,
		visible smallint unsigned default '1',
		--
		create_time bigint unsigned not null,
		last_modify_time bigint unsigned not null,
		creator_id bigint unsigned not null,
		last_modifier_id bigint unsigned not null,
		primary key (type_id),
		constraint fk_description_types_creator_id
			foreign key (creator_id) 
				references users (user_id)
				on update cascade
				on delete cascade,
		constraint fk_description_types_last_modifier_id
			foreign key (last_modifier_id) 
				references users (user_id)
				on update cascade
				on delete cascade
	) engine = innodb charset = utf8;

	create table descriptions(
		description_id bigint unsigned not null auto_increment,
		type_id int unsigned not null,
		title varchar(255),
		description text,
		visible smallint unsigned default '1',
		--
		create_time bigint unsigned not null,
		last_modify_time bigint unsigned not null,
		creator_id bigint unsigned not null,
		last_modifier_id bigint unsigned not null,
		primary key (description_id),
		constraint fk_descriptions_type_id
			foreign key (type_id)
				references description_types(type_id)
				on update cascade
				on delete cascade,
		constraint fk_descriptions_creator_id
			foreign key (creator_id) 
				references users (user_id)
				on update cascade
				on delete cascade,
		constraint fk_descriptions_last_modifier_id
			foreign key (last_modifier_id) 
				references users (user_id)
				on update cascade
				on delete cascade
	) engine = innodb charset = utf8;

	create table rt_products_craft_types(
		r_id bigint unsigned auto_increment,
		craft_type_id smallint unsigned not null,
		product_id bigint unsigned not null,
		visible smallint unsigned default '1',
		--
		create_time bigint unsigned not null,
		last_modify_time bigint unsigned not null,
		creator_id bigint unsigned not null,
		last_modifier_id bigint unsigned not null,
		primary key (r_id),
		constraint fk_rt_product_craft_type_product_id
			foreign key (product_id)
			references products(product_id)
			on update cascade
			on delete cascade,
		constraint fk_rt_product_craft_type_craft_type_id
			foreign key (craft_type_id)
			references craft_types(craft_type_id)
			on update cascade
			on delete cascade,
		constraint fk_rt_product_craft_types_creator_id
			foreign key (creator_id) 
				references users (user_id)
				on update cascade
				on delete cascade,
		constraint fk_rt_product_craft_types_last_modifier_id
			foreign key (last_modifier_id) 
				references users (user_id)
				on update cascade
				on delete cascade,
		unique ui_rt_product_craft_types (craft_type_id, product_id)
	) engine = innodb charset = utf8;

	create table rt_products_discription(
		r_id bigint unsigned auto_increment,
		product_id bigint unsigned not null,
		title varchar(64) not null,
		descreption text,
		visible smallint unsigned default '1',
		--
		create_time bigint unsigned not null,
		last_modify_time bigint unsigned not null,
		creator_id bigint unsigned not null,
		last_modifier_id bigint unsigned not null,
		primary key (r_id),
		constraint fk_rt_product_discription_product_id
			foreign key (product_id)
			references products(product_id)
			on update cascade
			on delete cascade,
		constraint fk_rt_product_discription_creator_id
			foreign key (creator_id) 
				references users (user_id)
				on update cascade
				on delete cascade,
		constraint fk_rt_product_discription_last_modifier_id
			foreign key (last_modifier_id) 
				references users (user_id)
				on update cascade
				on delete cascade
	) engine = innodb charset = utf8;

	create table rt_products_main_photos(
		r_id bigint unsigned auto_increment,
		product_id bigint unsigned not null,
		type_id int unsigned not null,
		sequence_number int unsigned not null,
		address varchar(255) not null,
		descreption text,
		visible smallint unsigned default '1',
		--
		create_time bigint unsigned not null,
		last_modify_time bigint unsigned not null,
		creator_id bigint unsigned not null,
		last_modifier_id bigint unsigned not null,
		primary key (r_id),
		constraint fk_rt_products_main_photo_product_id
			foreign key (product_id)
			references products(product_id)
			on update cascade
			on delete cascade,
		constraint fk_rt_products_main_photo_type_id
			foreign key (type_id)
			references photo_types(type_id)
			on update cascade
			on delete cascade,
		constraint fk_rt_products_main_photo_creator_id
			foreign key (creator_id) 
				references users (user_id)
				on update cascade
				on delete cascade,
		constraint fk_rt_products_main_photo_last_modifier_id
			foreign key (last_modifier_id) 
				references users (user_id)
				on update cascade
				on delete cascade
	) engine = innodb charset = utf8;

	create table rt_products_tags(
		r_id bigint unsigned auto_increment,
		product_id bigint unsigned not null,
		tag_id smallint unsigned not null,
		visible smallint unsigned default '1',
		--
		create_time bigint unsigned not null,
		last_modify_time bigint unsigned not null,
		creator_id bigint unsigned not null,
		last_modifier_id bigint unsigned not null,
		primary key (r_id),
		constraint fk_rt_products_tags_product_id
			foreign key (product_id)
			references products(product_id)
			on update cascade
			on delete cascade,
		constraint fk_rt_products_tags_tag_id
			foreign key (tag_id)
			references tags(tag_id)
			on update cascade
			on delete cascade
	) engine = innodb charset = utf8;

	create table rt_products_brands(
		r_id bigint unsigned auto_increment,
		product_id bigint unsigned not null,
		brand_id smallint unsigned not null,
		visible smallint unsigned default '1',
		--
		create_time bigint unsigned not null,
		last_modify_time bigint unsigned not null,
		creator_id bigint unsigned not null,
		last_modifier_id bigint unsigned not null,
		primary key (r_id),
		constraint fk_rt_products_brands_product_id
			foreign key (product_id)
			references products(product_id)
			on update cascade
			on delete cascade,
		constraint fk_rt_products_brands_brand_id
			foreign key (brand_id)
			references brands(brand_id)
			on update cascade
			on delete cascade,
		--
		constraint fk_rt_product_brand_creator_id
			foreign key (creator_id) 
				references users (user_id)
				on update cascade
				on delete cascade,
		constraint fk_rt_product_brand_last_modifier_id
			foreign key (last_modifier_id) 
				references users (user_id)
				on update cascade
				on delete cascade
	) engine = innodb charset = utf8;

	create table rt_products_discounts(
		r_id bigint unsigned auto_increment,
		product_id bigint unsigned not null,
		discount_type_id smallint unsigned not null,
		visible smallint unsigned default '1',
		--
		create_time bigint unsigned not null,
		last_modify_time bigint unsigned not null,
		creator_id bigint unsigned not null,
		last_modifier_id bigint unsigned not null,
		primary key (r_id),
		constraint fk_rt_product_discounts_discount_type_id
			foreign key (discount_type_id) 
				references discounts (discount_type_id)
				on update cascade
				on delete cascade,
		constraint fk_rt_product_discounts_product_id
			foreign key (product_id) 
				references products (product_id)
				on update cascade
				on delete cascade,
		constraint fk_rt_product_discounts_creator_id
			foreign key (creator_id) 
				references users (user_id)
				on update cascade
				on delete cascade,
		constraint fk_rt_product_discounts_last_modifier_id
			foreign key (last_modifier_id) 
				references users (user_id)
				on update cascade
				on delete cascade
	) engine = innodb charset = utf8;

	create table rt_products_categories_l1(
		category_l1_id smallint unsigned not null auto_increment,
		category_name varchar(255) not null,
		visible smallint unsigned default '1',
		--
		create_time bigint unsigned not null,
		last_modify_time bigint unsigned not null,
		creator_id bigint unsigned not null,
		last_modifier_id bigint unsigned not null,
		primary key (category_l1_id),
		constraint fk_rt_products_categories_l1_creator_id
			foreign key (creator_id) 
				references users (user_id)
				on update cascade
				on delete cascade,
		constraint fk_rt_products_categories_l1_last_modifier_id
			foreign key (last_modifier_id) 
				references users (user_id)
				on update cascade
				on delete cascade
	) engine = innodb charset = utf8;

	create table rt_products_categories_l2(
		category_l2_id smallint unsigned not null auto_increment,
		parent_id smallint unsigned not null,
		visible smallint unsigned default '1',
		--
		category_name varchar(255) not null,
		create_time bigint unsigned not null,
		last_modify_time bigint unsigned not null,
		creator_id bigint unsigned not null,
		last_modifier_id bigint unsigned not null,
		primary key (category_l2_id),
		constraint fk_rt_products_categories_l2_parent_id
			foreign key (parent_id) 
				references rt_products_categories_l1(category_l1_id)
				on update cascade
				on delete cascade,
		--
		constraint fk_rt_products_categories_l2_creator_id
			foreign key (creator_id)
				references users (user_id)
				on update cascade
				on delete cascade,
		constraint fk_rt_products_categories_l2_last_modifier_id
			foreign key (last_modifier_id) 
				references users (user_id)
				on update cascade
				on delete cascade
	) engine = innodb charset = utf8;

	create table rt_products_categories_l3(
		category_l3_id smallint unsigned not null auto_increment,
		parent_id smallint unsigned not null,
		category_name varchar(255) not null,
		visible smallint unsigned default '1',
		--
		create_time bigint unsigned not null,
		last_modify_time bigint unsigned not null,
		creator_id bigint unsigned not null,
		last_modifier_id bigint unsigned not null,
		primary key (category_l3_id),
		constraint fk_rt_products_categories_l3_parent_id
			foreign key (parent_id) 
				references rt_products_categories_l2(category_l2_id)
				on update cascade
				on delete cascade,
		--
		constraint fk_rt_products_categories_l3_creator_id
			foreign key (creator_id) 
				references users (user_id)
				on update cascade
				on delete cascade,
		constraint fk_rt_products_categories_l3_last_modifier_id
			foreign key (last_modifier_id) 
				references users (user_id)
				on update cascade
				on delete cascade
	) engine = innodb charset = utf8;

	create table rt_products_categories_l4(
		category_l4_id smallint unsigned not null auto_increment,
		parent_id smallint unsigned not null,
		category_name varchar(255) not null,
		--
		visible smallint unsigned default '1',
		create_time bigint unsigned not null,
		last_modify_time bigint unsigned not null,
		creator_id bigint unsigned not null,
		last_modifier_id bigint unsigned not null,
		primary key (category_l4_id),
		constraint fk_rt_products_categories_l4_parent_id
			foreign key (parent_id) 
				references rt_products_categories_l3(category_l3_id)
				on update cascade
				on delete cascade,
		--
		constraint fk_rt_products_categories_l4_creator_id
			foreign key (creator_id) 
				references users (user_id)
				on update cascade
				on delete cascade,
		constraint fk_rt_products_categories_l4_last_modifier_id
			foreign key (last_modifier_id) 
				references users (user_id)
				on update cascade
				on delete cascade
	) engine = innodb charset = utf8;

	create table cus_tables (
		table_id int unsigned not null,
		table_name varchar(255) not null,
		--
		visible smallint unsigned default '1',
		create_time bigint unsigned not null,
		last_modify_time bigint unsigned not null,
		creator_id bigint unsigned not null,
		last_modifier_id bigint unsigned not null,
		primary key (table_id),
		--
		constraint fk_cus_tables_creator_id
			foreign key (creator_id)
				references users (user_id)
				on update cascade
				on delete cascade,
		constraint fk_cus_tables_modifier_id
			foreign key (last_modifier_id) 
				references users (user_id)
				on update cascade
				on delete cascade
	) engine = innodb charset = utf8;

	create table cus_products_properties (
		property_id int unsigned not null,
		property_name varchar(255) not null,
		category_l4_id smallint unsigned not null,
		--
		visible smallint unsigned default '1',
		create_time bigint unsigned not null,
		last_modify_time bigint unsigned not null,
		creator_id bigint unsigned not null,
		last_modifier_id bigint unsigned not null,
		primary key (property_id),
		constraint fk_cus_products_properties_category_l4_id
			foreign key (category_l4_id)
				references rt_products_categories_l4(category_l4_id)
				on update cascade
				on delete cascade,
		--
		constraint fk_cus_products_properties_creator_id
			foreign key (creator_id)
				references users (user_id)
				on update cascade
				on delete cascade,
		constraint fk_cus_products_properties_last_modifier_id
			foreign key (last_modifier_id) 
				references users (user_id)
				on update cascade
				on delete cascade
	) engine = innodb charset = utf8;
-- Products End --


-- Orders --
create table orders();

-- Messages --
create table messages();
create table rt_message_attachment();



-- Tpl --
	-- ralational table
