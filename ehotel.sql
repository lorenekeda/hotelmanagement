PGDMP      %                }        
   hotelchain    17.2    17.2 S    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16676 
   hotelchain    DATABASE     �   CREATE DATABASE hotelchain WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE hotelchain;
                     postgres    false            �           0    0    SCHEMA public    ACL     +   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
                        pg_database_owner    false    6                        2615    20868    relational_schema    SCHEMA     !   CREATE SCHEMA relational_schema;
    DROP SCHEMA relational_schema;
                     postgres    false            �            1259    21102    archive    TABLE     �   CREATE TABLE relational_schema.archive (
    archive_id integer NOT NULL,
    start_date date NOT NULL,
    room_num integer NOT NULL,
    hotel_id integer NOT NULL,
    chain_id integer NOT NULL
);
 &   DROP TABLE relational_schema.archive;
       relational_schema         heap r       postgres    false    5            �            1259    21101    archive_archive_id_seq    SEQUENCE     �   CREATE SEQUENCE relational_schema.archive_archive_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE relational_schema.archive_archive_id_seq;
       relational_schema               postgres    false    5    238            �           0    0    archive_archive_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE relational_schema.archive_archive_id_seq OWNED BY relational_schema.archive.archive_id;
          relational_schema               postgres    false    237            �            1259    20872    booking    TABLE     �   CREATE TABLE relational_schema.booking (
    booking_start_date date NOT NULL,
    booking_end_date date,
    room_num integer NOT NULL,
    customer_id character varying,
    hotel_id integer NOT NULL,
    chain_id integer NOT NULL
);
 &   DROP TABLE relational_schema.booking;
       relational_schema         heap r       postgres    false    5            �            1259    20877    chain_address    TABLE     z   CREATE TABLE relational_schema.chain_address (
    chain_id integer NOT NULL,
    c_address character varying NOT NULL
);
 ,   DROP TABLE relational_schema.chain_address;
       relational_schema         heap r       postgres    false    5            �            1259    20882    chain_email    TABLE     v   CREATE TABLE relational_schema.chain_email (
    chain_id integer NOT NULL,
    c_email character varying NOT NULL
);
 *   DROP TABLE relational_schema.chain_email;
       relational_schema         heap r       postgres    false    5            �            1259    20887    chain_number    TABLE     s   CREATE TABLE relational_schema.chain_number (
    chain_id integer NOT NULL,
    c_phone_number bigint NOT NULL
);
 +   DROP TABLE relational_schema.chain_number;
       relational_schema         heap r       postgres    false    5            �            1259    20890    customer    TABLE     "  CREATE TABLE relational_schema.customer (
    customer_id character varying NOT NULL,
    registration_date character varying,
    first_name character varying,
    last_name character varying,
    id_type character varying,
    address character varying,
    password character varying
);
 '   DROP TABLE relational_schema.customer;
       relational_schema         heap r       postgres    false    5            �            1259    20895    employee    TABLE       CREATE TABLE relational_schema.employee (
    employee_ssn integer NOT NULL,
    first_name character varying,
    last_name character varying,
    address character varying,
    "position" character varying,
    hotel_id integer,
    chain_id integer,
    password character varying
);
 '   DROP TABLE relational_schema.employee;
       relational_schema         heap r       postgres    false    5            �            1259    20900    has    TABLE     �   CREATE TABLE relational_schema.has (
    booking_start_date date NOT NULL,
    room_num integer NOT NULL,
    customer_id character varying,
    card_number integer,
    hotel_id integer NOT NULL,
    chain_id integer NOT NULL
);
 "   DROP TABLE relational_schema.has;
       relational_schema         heap r       postgres    false    5            �            1259    20910    hotel    TABLE     �   CREATE TABLE relational_schema.hotel (
    hotel_id integer NOT NULL,
    chain_id integer NOT NULL,
    address character varying,
    name character varying,
    rating integer,
    num_of_room integer
);
 $   DROP TABLE relational_schema.hotel;
       relational_schema         heap r       postgres    false    5            �            1259    20915    hotel_chain    TABLE     �   CREATE TABLE relational_schema.hotel_chain (
    chain_id integer NOT NULL,
    chain_name character varying,
    num_of_hotel integer
);
 *   DROP TABLE relational_schema.hotel_chain;
       relational_schema         heap r       postgres    false    5            �            1259    20920    hotel_email    TABLE     �   CREATE TABLE relational_schema.hotel_email (
    chain_id integer NOT NULL,
    hotel_id integer NOT NULL,
    h_email character varying NOT NULL
);
 *   DROP TABLE relational_schema.hotel_email;
       relational_schema         heap r       postgres    false    5            �            1259    20925    hotel_phone    TABLE     �   CREATE TABLE relational_schema.hotel_phone (
    chain_id integer NOT NULL,
    hotel_id integer NOT NULL,
    h_phone_number bigint NOT NULL
);
 *   DROP TABLE relational_schema.hotel_phone;
       relational_schema         heap r       postgres    false    5            �            1259    20928    hotel_room_capacity    VIEW     �   CREATE VIEW relational_schema.hotel_room_capacity AS
 SELECT chain_id,
    hotel_id,
    sum(num_of_room) AS total_rooms
   FROM relational_schema.hotel
  GROUP BY chain_id, hotel_id;
 1   DROP VIEW relational_schema.hotel_room_capacity;
       relational_schema       v       postgres    false    225    225    225    5            �            1259    20932    manager    TABLE       CREATE TABLE relational_schema.manager (
    ssn integer NOT NULL,
    "position" character varying,
    hotel_id integer NOT NULL,
    chain_id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    address character varying
);
 &   DROP TABLE relational_schema.manager;
       relational_schema         heap r       postgres    false    5            �            1259    20937    payment    TABLE     �   CREATE TABLE relational_schema.payment (
    card_number integer NOT NULL,
    cvv integer,
    expiry_date character varying,
    customer_id character varying
);
 &   DROP TABLE relational_schema.payment;
       relational_schema         heap r       postgres    false    5            �            1259    20942    renting    TABLE     �   CREATE TABLE relational_schema.renting (
    start_date date NOT NULL,
    end_date date,
    room_num integer NOT NULL,
    customer_id character varying,
    employee_ssn integer,
    hotel_id integer NOT NULL,
    chain_id integer NOT NULL
);
 &   DROP TABLE relational_schema.renting;
       relational_schema         heap r       postgres    false    5            �            1259    20947    room    TABLE     �   CREATE TABLE relational_schema.room (
    room_num integer NOT NULL,
    view character varying,
    extendable boolean,
    capacity character varying,
    price integer,
    hotel_id integer NOT NULL,
    chain_id integer NOT NULL
);
 #   DROP TABLE relational_schema.room;
       relational_schema         heap r       postgres    false    5            �            1259    20952    room_amenity    TABLE     �   CREATE TABLE relational_schema.room_amenity (
    room_num integer NOT NULL,
    hotel_id integer NOT NULL,
    chain_id integer NOT NULL,
    amenity character varying NOT NULL
);
 +   DROP TABLE relational_schema.room_amenity;
       relational_schema         heap r       postgres    false    5            �            1259    20957    room_damage    TABLE     �   CREATE TABLE relational_schema.room_damage (
    room_num integer NOT NULL,
    hotel_id integer NOT NULL,
    chain_id integer NOT NULL,
    damage character varying NOT NULL
);
 *   DROP TABLE relational_schema.room_damage;
       relational_schema         heap r       postgres    false    5            �            1259    20962    rooms_per_area    VIEW     �   CREATE VIEW relational_schema.rooms_per_area AS
 SELECT address,
    sum(num_of_room) AS num_of_rooms
   FROM relational_schema.hotel
  GROUP BY address;
 ,   DROP VIEW relational_schema.rooms_per_area;
       relational_schema       v       postgres    false    225    225    5            �           2604    21105    archive archive_id    DEFAULT     �   ALTER TABLE ONLY relational_schema.archive ALTER COLUMN archive_id SET DEFAULT nextval('relational_schema.archive_archive_id_seq'::regclass);
 L   ALTER TABLE relational_schema.archive ALTER COLUMN archive_id DROP DEFAULT;
       relational_schema               postgres    false    237    238    238                      0    21102    archive 
   TABLE DATA                 relational_schema               postgres    false    238   �n       m          0    20872    booking 
   TABLE DATA                 relational_schema               postgres    false    218   �n       n          0    20877    chain_address 
   TABLE DATA                 relational_schema               postgres    false    219   �n       o          0    20882    chain_email 
   TABLE DATA                 relational_schema               postgres    false    220   Yo       p          0    20887    chain_number 
   TABLE DATA                 relational_schema               postgres    false    221   
p       q          0    20890    customer 
   TABLE DATA                 relational_schema               postgres    false    222   �p       r          0    20895    employee 
   TABLE DATA                 relational_schema               postgres    false    223   �q       s          0    20900    has 
   TABLE DATA                 relational_schema               postgres    false    224   �r       t          0    20910    hotel 
   TABLE DATA                 relational_schema               postgres    false    225   �r       u          0    20915    hotel_chain 
   TABLE DATA                 relational_schema               postgres    false    226   �u       v          0    20920    hotel_email 
   TABLE DATA                 relational_schema               postgres    false    227   �v       w          0    20925    hotel_phone 
   TABLE DATA                 relational_schema               postgres    false    228   �w       x          0    20932    manager 
   TABLE DATA                 relational_schema               postgres    false    230   �y       y          0    20937    payment 
   TABLE DATA                 relational_schema               postgres    false    231   
z       z          0    20942    renting 
   TABLE DATA                 relational_schema               postgres    false    232   $z       {          0    20947    room 
   TABLE DATA                 relational_schema               postgres    false    233   >z       |          0    20952    room_amenity 
   TABLE DATA                 relational_schema               postgres    false    234   ��       }          0    20957    room_damage 
   TABLE DATA                 relational_schema               postgres    false    235   ��       �           0    0    archive_archive_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('relational_schema.archive_archive_id_seq', 1, false);
          relational_schema               postgres    false    237            �           2606    21107    archive archive_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY relational_schema.archive
    ADD CONSTRAINT archive_pkey PRIMARY KEY (archive_id);
 I   ALTER TABLE ONLY relational_schema.archive DROP CONSTRAINT archive_pkey;
       relational_schema                 postgres    false    238            �           2606    20969    booking booking_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY relational_schema.booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (booking_start_date, room_num, hotel_id, chain_id);
 I   ALTER TABLE ONLY relational_schema.booking DROP CONSTRAINT booking_pkey;
       relational_schema                 postgres    false    218    218    218    218            �           2606    20971    chain_address c_address 
   CONSTRAINT     q   ALTER TABLE ONLY relational_schema.chain_address
    ADD CONSTRAINT c_address PRIMARY KEY (c_address, chain_id);
 L   ALTER TABLE ONLY relational_schema.chain_address DROP CONSTRAINT c_address;
       relational_schema                 postgres    false    219    219            �           2606    20973    chain_email c_email 
   CONSTRAINT     k   ALTER TABLE ONLY relational_schema.chain_email
    ADD CONSTRAINT c_email PRIMARY KEY (c_email, chain_id);
 H   ALTER TABLE ONLY relational_schema.chain_email DROP CONSTRAINT c_email;
       relational_schema                 postgres    false    220    220            �           2606    20975    chain_number c_phone_number 
   CONSTRAINT     z   ALTER TABLE ONLY relational_schema.chain_number
    ADD CONSTRAINT c_phone_number PRIMARY KEY (c_phone_number, chain_id);
 P   ALTER TABLE ONLY relational_schema.chain_number DROP CONSTRAINT c_phone_number;
       relational_schema                 postgres    false    221    221            �           2606    20977    hotel_chain chain_id 
   CONSTRAINT     c   ALTER TABLE ONLY relational_schema.hotel_chain
    ADD CONSTRAINT chain_id PRIMARY KEY (chain_id);
 I   ALTER TABLE ONLY relational_schema.hotel_chain DROP CONSTRAINT chain_id;
       relational_schema                 postgres    false    226            �           2606    20979    customer customer_id 
   CONSTRAINT     f   ALTER TABLE ONLY relational_schema.customer
    ADD CONSTRAINT customer_id PRIMARY KEY (customer_id);
 I   ALTER TABLE ONLY relational_schema.customer DROP CONSTRAINT customer_id;
       relational_schema                 postgres    false    222            �           2606    20981    employee employee_ssn 
   CONSTRAINT     h   ALTER TABLE ONLY relational_schema.employee
    ADD CONSTRAINT employee_ssn PRIMARY KEY (employee_ssn);
 J   ALTER TABLE ONLY relational_schema.employee DROP CONSTRAINT employee_ssn;
       relational_schema                 postgres    false    223            �           2606    20983    hotel_email h_email_pk 
   CONSTRAINT     x   ALTER TABLE ONLY relational_schema.hotel_email
    ADD CONSTRAINT h_email_pk PRIMARY KEY (h_email, chain_id, hotel_id);
 K   ALTER TABLE ONLY relational_schema.hotel_email DROP CONSTRAINT h_email_pk;
       relational_schema                 postgres    false    227    227    227            �           2606    20985    hotel_phone h_phone_number_pk 
   CONSTRAINT     �   ALTER TABLE ONLY relational_schema.hotel_phone
    ADD CONSTRAINT h_phone_number_pk PRIMARY KEY (h_phone_number, chain_id, hotel_id);
 R   ALTER TABLE ONLY relational_schema.hotel_phone DROP CONSTRAINT h_phone_number_pk;
       relational_schema                 postgres    false    228    228    228            �           2606    20987    has has_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY relational_schema.has
    ADD CONSTRAINT has_pkey PRIMARY KEY (booking_start_date, room_num, hotel_id, chain_id);
 A   ALTER TABLE ONLY relational_schema.has DROP CONSTRAINT has_pkey;
       relational_schema                 postgres    false    224    224    224    224            �           2606    20991    hotel hotel_pk 
   CONSTRAINT     g   ALTER TABLE ONLY relational_schema.hotel
    ADD CONSTRAINT hotel_pk PRIMARY KEY (hotel_id, chain_id);
 C   ALTER TABLE ONLY relational_schema.hotel DROP CONSTRAINT hotel_pk;
       relational_schema                 postgres    false    225    225            �           2606    20993    manager manager_pk 
   CONSTRAINT     p   ALTER TABLE ONLY relational_schema.manager
    ADD CONSTRAINT manager_pk PRIMARY KEY (ssn, hotel_id, chain_id);
 G   ALTER TABLE ONLY relational_schema.manager DROP CONSTRAINT manager_pk;
       relational_schema                 postgres    false    230    230    230            �           2606    20995    payment payment_pk 
   CONSTRAINT     d   ALTER TABLE ONLY relational_schema.payment
    ADD CONSTRAINT payment_pk PRIMARY KEY (card_number);
 G   ALTER TABLE ONLY relational_schema.payment DROP CONSTRAINT payment_pk;
       relational_schema                 postgres    false    231            �           2606    20997    renting renting_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY relational_schema.renting
    ADD CONSTRAINT renting_pkey PRIMARY KEY (start_date, room_num, hotel_id, chain_id);
 I   ALTER TABLE ONLY relational_schema.renting DROP CONSTRAINT renting_pkey;
       relational_schema                 postgres    false    232    232    232    232            �           2606    20999    room_amenity room_amenity_pk 
   CONSTRAINT     �   ALTER TABLE ONLY relational_schema.room_amenity
    ADD CONSTRAINT room_amenity_pk PRIMARY KEY (hotel_id, chain_id, room_num, amenity);
 Q   ALTER TABLE ONLY relational_schema.room_amenity DROP CONSTRAINT room_amenity_pk;
       relational_schema                 postgres    false    234    234    234    234            �           2606    21001    room_damage room_damage_pk 
   CONSTRAINT     �   ALTER TABLE ONLY relational_schema.room_damage
    ADD CONSTRAINT room_damage_pk PRIMARY KEY (room_num, chain_id, hotel_id, damage);
 O   ALTER TABLE ONLY relational_schema.room_damage DROP CONSTRAINT room_damage_pk;
       relational_schema                 postgres    false    235    235    235    235            �           2606    21003    room room_pk 
   CONSTRAINT     o   ALTER TABLE ONLY relational_schema.room
    ADD CONSTRAINT room_pk PRIMARY KEY (room_num, chain_id, hotel_id);
 A   ALTER TABLE ONLY relational_schema.room DROP CONSTRAINT room_pk;
       relational_schema                 postgres    false    233    233    233            �           2606    21004     booking booking_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.booking
    ADD CONSTRAINT booking_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES relational_schema.customer(customer_id);
 U   ALTER TABLE ONLY relational_schema.booking DROP CONSTRAINT booking_customer_id_fkey;
       relational_schema               postgres    false    218    4782    222            �           2606    21009 /   booking booking_room_num_hotel_id_chain_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.booking
    ADD CONSTRAINT booking_room_num_hotel_id_chain_id_fkey FOREIGN KEY (room_num, hotel_id, chain_id) REFERENCES relational_schema.room(room_num, hotel_id, chain_id);
 d   ALTER TABLE ONLY relational_schema.booking DROP CONSTRAINT booking_room_num_hotel_id_chain_id_fkey;
       relational_schema               postgres    false    233    4802    233    218    218    218    233            �           2606    21014 3   chain_address chain_address_hotel_chain_chain_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.chain_address
    ADD CONSTRAINT chain_address_hotel_chain_chain_id_fk FOREIGN KEY (chain_id) REFERENCES relational_schema.hotel_chain(chain_id);
 h   ALTER TABLE ONLY relational_schema.chain_address DROP CONSTRAINT chain_address_hotel_chain_chain_id_fk;
       relational_schema               postgres    false    226    219    4790            �           2606    21019 /   chain_email chain_email_hotel_chain_chain_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.chain_email
    ADD CONSTRAINT chain_email_hotel_chain_chain_id_fk FOREIGN KEY (chain_id) REFERENCES relational_schema.hotel_chain(chain_id);
 d   ALTER TABLE ONLY relational_schema.chain_email DROP CONSTRAINT chain_email_hotel_chain_chain_id_fk;
       relational_schema               postgres    false    226    4790    220            �           2606    21024 1   chain_number chain_number_hotel_chain_chain_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.chain_number
    ADD CONSTRAINT chain_number_hotel_chain_chain_id_fk FOREIGN KEY (chain_id) REFERENCES relational_schema.hotel_chain(chain_id);
 f   ALTER TABLE ONLY relational_schema.chain_number DROP CONSTRAINT chain_number_hotel_chain_chain_id_fk;
       relational_schema               postgres    false    4790    221    226            �           2606    21029 ,   employee employee_hotel_hotel_id_chain_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.employee
    ADD CONSTRAINT employee_hotel_hotel_id_chain_id_fk FOREIGN KEY (hotel_id, chain_id) REFERENCES relational_schema.hotel(hotel_id, chain_id);
 a   ALTER TABLE ONLY relational_schema.employee DROP CONSTRAINT employee_hotel_hotel_id_chain_id_fk;
       relational_schema               postgres    false    225    4788    223    223    225            �           2606    21034    has has_card_number_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.has
    ADD CONSTRAINT has_card_number_fkey FOREIGN KEY (card_number) REFERENCES relational_schema.payment(card_number);
 M   ALTER TABLE ONLY relational_schema.has DROP CONSTRAINT has_card_number_fkey;
       relational_schema               postgres    false    224    231    4798            �           2606    21039    has has_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.has
    ADD CONSTRAINT has_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES relational_schema.customer(customer_id);
 M   ALTER TABLE ONLY relational_schema.has DROP CONSTRAINT has_customer_id_fkey;
       relational_schema               postgres    false    4782    222    224            �           2606    21044 '   has has_room_num_hotel_id_chain_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.has
    ADD CONSTRAINT has_room_num_hotel_id_chain_id_fkey FOREIGN KEY (room_num, hotel_id, chain_id) REFERENCES relational_schema.room(room_num, hotel_id, chain_id);
 \   ALTER TABLE ONLY relational_schema.has DROP CONSTRAINT has_room_num_hotel_id_chain_id_fkey;
       relational_schema               postgres    false    233    233    4802    224    224    224    233            �           2606    21049    hotel hotel_chain_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.hotel
    ADD CONSTRAINT hotel_chain_id_fkey FOREIGN KEY (chain_id) REFERENCES relational_schema.hotel_chain(chain_id);
 N   ALTER TABLE ONLY relational_schema.hotel DROP CONSTRAINT hotel_chain_id_fkey;
       relational_schema               postgres    false    225    226    4790            �           2606    21054 2   hotel_email hotel_email_hotel_chain_id_hotel_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.hotel_email
    ADD CONSTRAINT hotel_email_hotel_chain_id_hotel_id_fk FOREIGN KEY (chain_id, hotel_id) REFERENCES relational_schema.hotel(chain_id, hotel_id);
 g   ALTER TABLE ONLY relational_schema.hotel_email DROP CONSTRAINT hotel_email_hotel_chain_id_hotel_id_fk;
       relational_schema               postgres    false    227    225    227    4788    225            �           2606    21059 2   hotel_phone hotel_phone_hotel_chain_id_hotel_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.hotel_phone
    ADD CONSTRAINT hotel_phone_hotel_chain_id_hotel_id_fk FOREIGN KEY (chain_id, hotel_id) REFERENCES relational_schema.hotel(chain_id, hotel_id);
 g   ALTER TABLE ONLY relational_schema.hotel_phone DROP CONSTRAINT hotel_phone_hotel_chain_id_hotel_id_fk;
       relational_schema               postgres    false    4788    228    228    225    225            �           2606    21064 '   payment payment_customer_customer_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.payment
    ADD CONSTRAINT payment_customer_customer_id_fk FOREIGN KEY (customer_id) REFERENCES relational_schema.customer(customer_id);
 \   ALTER TABLE ONLY relational_schema.payment DROP CONSTRAINT payment_customer_customer_id_fk;
       relational_schema               postgres    false    4782    231    222            �           2606    21069     renting renting_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.renting
    ADD CONSTRAINT renting_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES relational_schema.customer(customer_id);
 U   ALTER TABLE ONLY relational_schema.renting DROP CONSTRAINT renting_customer_id_fkey;
       relational_schema               postgres    false    222    4782    232            �           2606    21074 !   renting renting_employee_ssn_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.renting
    ADD CONSTRAINT renting_employee_ssn_fkey FOREIGN KEY (employee_ssn) REFERENCES relational_schema.employee(employee_ssn);
 V   ALTER TABLE ONLY relational_schema.renting DROP CONSTRAINT renting_employee_ssn_fkey;
       relational_schema               postgres    false    223    4784    232            �           2606    21079 /   renting renting_room_num_hotel_id_chain_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.renting
    ADD CONSTRAINT renting_room_num_hotel_id_chain_id_fkey FOREIGN KEY (room_num, hotel_id, chain_id) REFERENCES relational_schema.room(room_num, hotel_id, chain_id);
 d   ALTER TABLE ONLY relational_schema.renting DROP CONSTRAINT renting_room_num_hotel_id_chain_id_fkey;
       relational_schema               postgres    false    4802    232    232    233    233    233    232            �           2606    21084 $   room room_hotel_hotel_id_chain_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.room
    ADD CONSTRAINT room_hotel_hotel_id_chain_id_fk FOREIGN KEY (hotel_id, chain_id) REFERENCES relational_schema.hotel(hotel_id, chain_id);
 Y   ALTER TABLE ONLY relational_schema.room DROP CONSTRAINT room_hotel_hotel_id_chain_id_fk;
       relational_schema               postgres    false    225    225    4788    233    233               
   x���          m   
   x���          n   �   x��̽
�0@�Oq��P�'��Ai�F�%	6��B��M� �9�Ǻ��s`��)�A�E3z1�bBmG��)��������y�=���j��6Prrd���`��d�"އ��k'z����y���~�����	?F�����^_ט�      o   �   x���?�0G�~���B����С lu-G��0M ��7��7��~7�wM�������%:�
�`�4θ�<��"zU ⩄����;(���f[A>�tZ�z�sļ<eM�v>!��΅���pe�3��C�!����G+t�3�ӳ���;4�{�ϲ{8�V      p   �   x����
�@��>��p�t:u� �AZWٶ�t��O�aO�?|_ݴե���ΰ�Q��٩�ik&��V�w��n���@�������n�ӵj!�*���xNQ� 2���`�9xa����s��&%ʸd����D$(����L��      q   $  x�͒Ak�0������"��m��-�ak��{�E�I5���.�_߸Х���e�1����f4y�!��gТaF��5��h�_hT+4�~U!�g+�F��Ό��]j4E�Z�v����[�8�у�!��k8<�_
+��۪e��Kպ�t���i l��A�.�0���űH5���_B�.�^��C1O�Xk��t��]�����v�ϲ��$n�h�JU_��曽_�⒐ ��0@$���m�j0�R��B&��ys7!��/���d��P��[�D��~�j���'n      r   �   x�͏�
�@��<�b��m�,RD��6,f�N�'��o(� n3�S��]��C��o��Ơ�E��I��	�A�;�_�c���s�,��m��=1�U�	�.��T/�$Q٧���|_�q�:4;��T@~u��Q٨ ��1p�D!}qD�2]�jZ�b���b��BR�� ���Ĺ(-^��ƩO�= ҵ��      s   
   x���          t   �  x��YMo�0��W��VB)���H��~�iY�	M�X$��vZ��wc�tE�d��D�i��{���1������Ӽ+��jf��pV*�+v�z������\=AQhnL�I�y�i�K9�ߚz��gZ���Mo��F);I\uXr��:��$X8ƧQY%��a��G�hz���..��Ë����,�Ԃf�:���
�ҁB��!�6ҍ��¹v�-
����S����߳����vn?���J�s�@#�hO�� ͗M�ߴ�kϊFyY+"�b���}���#�Qi[�)�\5����B�/鮄����������r~$�Mر�U��Ղ;8���P�ƙ��� zQB�(	9��ud!�s�j�?���f{=
IkRI/K�֚QU��4�����<
98⑷��R�9�cl!W�x�U2m��˸�H�	 M]cB���H���O$�66��FG� �l���&I���aw��]X'ܸ��k�U���!���ՖMϪ2J�gԦHnB�|�����mq��L��j����/��IHD$�m���W[Er��C�;�	�wk�2�,`L"��R�oհ����n����6��/��h8D�ÀB�$�h�oU�G�;�4��̼.=�B�b���"L<�{�3nˈ�hռ����H�0��[H���֌r��r}�~�u��!r\�k��jr4���D��]k'RH��6�I�[eo�/�(��m���v��n���� �F2��mQH<t�=t�L::�Y�O      u   �   x���M
�0ཧ��
Aj��\��j�CL14&�Eo�Ğ!�7�>^���}��n`�D+�BI6��I[.)�P(H֠b$�Μ���T����³juI���⫐V��@���&�婣�Z4Fhk�V��<vrZ��r��n	;�{���i'�p��J�͢�3�压�c	��      v   g  x����k�0��EnmA����zFk�k	VP�*h.�ﷴ���{�D�o�����Q��㋘Z�L?J��k/�M�O�O��S�p�ϡ���>�>n������ �i�e(d$�������jn���1����Z��f�&&'�(��$��q�f������k3�r���j����h�b!��-Csq���m�n�Vb;N�����ɭ�Fnw㶒�qZ�o<��Hn4r+���Ԏ�R~+�yhDr+��[�ݸ�dv���[�C+ �[��
��m%�㴜�
xZ��
h�Vp7n+���V���
��V@#���q[)�8����V@$��܍����*;N��ww?Mɧ	�;� �)&iO      w   �  x����JCA��}��T��$s��Q�-U�P[���Nls��I)��#��d�.o��������1��_��~�[}�lƷ����5�V��~N^6��~�}=���;~���=���������pK=(�o�X�^,��ۄH5�H!�c"�-e�bbQԱF�1%�XqD�)�wGT`�3�#����(,ms��jB͜��)%�eg�9�[N 3��8�9�p�9��9�̜������*	n�'��8�4ƛ�k���G�� '������TX�����rf�#6Bޏf�#�>�o+�G��#�r.%�����B�U3�%"窙���G3g����fN��TJ�\~�8b�6dG��F3�Kn��_#�`N��Ի�$e��a�8"1r�3s<��
7�9"�h�8b���̩�Z!�oȞH誙�Ex�f�#��ps�����:��&�I��O�[������N�����j_      x   
   x���          y   
   x���          z   
   x���          {   N  x�՝Mo�F����9�B+je	=����"��W�����>Kj�_�B������g�C[�E��ݝ�wgwַ?}��sv���o�s�.�n[��������y��d��_���$��*��d��C�}(�Z���x*�÷I��\����qw(�w�C��Ǣ����>��_���){�&���,�'���X���O��z(���Xg�cu(럹�t:�����7��?_�����m�;n�Z��|�Y�<��P��_�,�_��7���s�/�z���?���R�8����R�R����e�׀>|���D�|���0Oa��x-���h�Rl����-�^o<����<|`^� �
I�_f���Y��%�e�|���,8h�f�%���z7���[�{�F��w>����
�����,6>��$Gx7	���9�r�[h��@r�{�sd	l�hL:qcf�,|�E��D܌����{�e���P�w2�M?*5$`�X��cMR�W��v���*M7��|����W����)����d=�ox�I��2ɢ�`����V��*�@K7��B+9\�t����띔��s�ր�x����	�+<�#�g+�³�^243P�ɫ��tbb��,a�5��
�SmJH@���\SM�|���e�����R����y�{KϒŝU��O����q�y�E>1&	e�Ek(m��7�H�0���4�MVv#}C�n���ϚMa���I��Y�!���.��n�*�/e�Y-o��"a�`���6����-���`:�xϒ�I�������.�ԟ���b���:�"h��z�|��]��$�$�ה�K׷V0Y"@����E-��*쎛@��"U~�P�W�0��WhUi�V1}�l�>/I��|r�T/�P<r�%MW[`��K"��$��P��K������\�Q�lC�>��~��D��Ca�ˎSXI5$��Xa"��TW�Ȩ���/�SzN���neԽw`����tՒ75��'!�pl6�[���a�TɅ�v��bz"���j�C�֪z��T��TQ��~�MƳ�ْO�OJ���G���3��1���TK�?�C�/��A�Sp�ؘ�Nr���}d�V�I<�;6dXk��`3����(��m{���ө���t���-U3�n�Ͻ��Y�|oa�����0��VL7�b�M�Z�DJ��@/�U�J�$m*ح�ؔ�u:[�j�ڝ��妡�t��f/e\ƆҦ��}���5s� ��'�@L�1�ZP1=ԤSTA.`���on�l�HzY͢CZY������D��j���ꅛ����6���Bz�~'q���"��m�zA$���t���" ]�T)H��1�����ӛ��:��|���1$i_G��a�hq�K��-��oG$=�hJ��LWdG�Տ����ׅ��iH�O7�Od�T$}���U�f���g����l�f_痰�4�Ý3�����Y�N���pXz��+�#���#M���}X3ҸG� �?@K:�1�����=�R�J52����#i��â�K��<SP���p�y,�%���V+��{����I��$=�x�b��n����g���<����Ӽ��~�e=On��_]�_�d%      |   
   x���          }   
   x���         