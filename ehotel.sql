PGDMP      3                }           hotelchain3    17.2    17.2 P    |           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            }           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            ~           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false                       1262    33446    hotelchain3    DATABASE        CREATE DATABASE hotelchain3 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Canada.1252';
    DROP DATABASE hotelchain3;
                     postgres    false            �           0    0    SCHEMA public    ACL     +   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
                        pg_database_owner    false    6                        2615    33447    relational_schema    SCHEMA     !   CREATE SCHEMA relational_schema;
    DROP SCHEMA relational_schema;
                     postgres    false            �            1259    33448    archive    TABLE     L   CREATE TABLE relational_schema.archive (
    archive_id integer NOT NULL
);
 &   DROP TABLE relational_schema.archive;
       relational_schema         heap r       postgres    false    5            �            1259    33451    booking    TABLE     �   CREATE TABLE relational_schema.booking (
    booking_start_date date NOT NULL,
    booking_end_date date,
    room_num integer NOT NULL,
    customer_id character varying,
    hotel_id integer NOT NULL,
    chain_id integer NOT NULL
);
 &   DROP TABLE relational_schema.booking;
       relational_schema         heap r       postgres    false    5            �            1259    33456    chain_address    TABLE     z   CREATE TABLE relational_schema.chain_address (
    chain_id integer NOT NULL,
    c_address character varying NOT NULL
);
 ,   DROP TABLE relational_schema.chain_address;
       relational_schema         heap r       postgres    false    5            �            1259    33461    chain_email    TABLE     v   CREATE TABLE relational_schema.chain_email (
    chain_id integer NOT NULL,
    c_email character varying NOT NULL
);
 *   DROP TABLE relational_schema.chain_email;
       relational_schema         heap r       postgres    false    5            �            1259    33466    chain_number    TABLE     s   CREATE TABLE relational_schema.chain_number (
    chain_id integer NOT NULL,
    c_phone_number bigint NOT NULL
);
 +   DROP TABLE relational_schema.chain_number;
       relational_schema         heap r       postgres    false    5            �            1259    33469    customer    TABLE     "  CREATE TABLE relational_schema.customer (
    customer_id character varying NOT NULL,
    registration_date character varying,
    first_name character varying,
    last_name character varying,
    id_type character varying,
    address character varying,
    password character varying
);
 '   DROP TABLE relational_schema.customer;
       relational_schema         heap r       postgres    false    5            �            1259    33474    employee    TABLE       CREATE TABLE relational_schema.employee (
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
       relational_schema         heap r       postgres    false    5            �            1259    33479    has    TABLE     �   CREATE TABLE relational_schema.has (
    booking_start_date date NOT NULL,
    room_num integer NOT NULL,
    customer_id character varying,
    card_number integer,
    hotel_id integer NOT NULL,
    chain_id integer NOT NULL
);
 "   DROP TABLE relational_schema.has;
       relational_schema         heap r       postgres    false    5            �            1259    33484    holds    TABLE     �   CREATE TABLE relational_schema.holds (
    archive_id integer NOT NULL,
    renting_start_date character varying NOT NULL,
    booking_start_date character varying NOT NULL
);
 $   DROP TABLE relational_schema.holds;
       relational_schema         heap r       postgres    false    5            �            1259    33489    hotel    TABLE     �   CREATE TABLE relational_schema.hotel (
    hotel_id integer NOT NULL,
    chain_id integer NOT NULL,
    address character varying,
    name character varying,
    rating integer,
    num_of_room integer
);
 $   DROP TABLE relational_schema.hotel;
       relational_schema         heap r       postgres    false    5            �            1259    33494    hotel_chain    TABLE     �   CREATE TABLE relational_schema.hotel_chain (
    chain_id integer NOT NULL,
    chain_name character varying,
    num_of_hotel integer
);
 *   DROP TABLE relational_schema.hotel_chain;
       relational_schema         heap r       postgres    false    5            �            1259    33499    hotel_email    TABLE     �   CREATE TABLE relational_schema.hotel_email (
    chain_id integer NOT NULL,
    hotel_id integer NOT NULL,
    h_email character varying NOT NULL
);
 *   DROP TABLE relational_schema.hotel_email;
       relational_schema         heap r       postgres    false    5            �            1259    33504    hotel_phone    TABLE     �   CREATE TABLE relational_schema.hotel_phone (
    chain_id integer NOT NULL,
    hotel_id integer NOT NULL,
    h_phone_number bigint NOT NULL
);
 *   DROP TABLE relational_schema.hotel_phone;
       relational_schema         heap r       postgres    false    5            �            1259    33507    manager    TABLE       CREATE TABLE relational_schema.manager (
    ssn integer NOT NULL,
    "position" character varying,
    hotel_id integer NOT NULL,
    chain_id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    address character varying
);
 &   DROP TABLE relational_schema.manager;
       relational_schema         heap r       postgres    false    5            �            1259    33512    payment    TABLE     �   CREATE TABLE relational_schema.payment (
    card_number integer NOT NULL,
    cvv integer,
    expiry_date character varying,
    customer_id character varying
);
 &   DROP TABLE relational_schema.payment;
       relational_schema         heap r       postgres    false    5            �            1259    33517    renting    TABLE     �   CREATE TABLE relational_schema.renting (
    start_date date NOT NULL,
    end_date date,
    room_num integer NOT NULL,
    customer_id character varying,
    employee_ssn integer,
    hotel_id integer NOT NULL,
    chain_id integer NOT NULL
);
 &   DROP TABLE relational_schema.renting;
       relational_schema         heap r       postgres    false    5            �            1259    33522    room    TABLE     �   CREATE TABLE relational_schema.room (
    room_num integer NOT NULL,
    view character varying,
    extendable boolean,
    capacity character varying,
    price integer,
    hotel_id integer NOT NULL,
    chain_id integer NOT NULL
);
 #   DROP TABLE relational_schema.room;
       relational_schema         heap r       postgres    false    5            �            1259    33527    room_amenity    TABLE     �   CREATE TABLE relational_schema.room_amenity (
    room_num integer NOT NULL,
    hotel_id integer NOT NULL,
    chain_id integer NOT NULL,
    amenity character varying NOT NULL
);
 +   DROP TABLE relational_schema.room_amenity;
       relational_schema         heap r       postgres    false    5            �            1259    33532    room_damage    TABLE     �   CREATE TABLE relational_schema.room_damage (
    room_num integer NOT NULL,
    hotel_id integer NOT NULL,
    chain_id integer NOT NULL,
    damage character varying NOT NULL
);
 *   DROP TABLE relational_schema.room_damage;
       relational_schema         heap r       postgres    false    5            g          0    33448    archive 
   TABLE DATA           8   COPY relational_schema.archive (archive_id) FROM stdin;
    relational_schema               postgres    false    218   ap       h          0    33451    booking 
   TABLE DATA           }   COPY relational_schema.booking (booking_start_date, booking_end_date, room_num, customer_id, hotel_id, chain_id) FROM stdin;
    relational_schema               postgres    false    219   ~p       i          0    33456    chain_address 
   TABLE DATA           G   COPY relational_schema.chain_address (chain_id, c_address) FROM stdin;
    relational_schema               postgres    false    220   �p       j          0    33461    chain_email 
   TABLE DATA           C   COPY relational_schema.chain_email (chain_id, c_email) FROM stdin;
    relational_schema               postgres    false    221   �p       k          0    33466    chain_number 
   TABLE DATA           K   COPY relational_schema.chain_number (chain_id, c_phone_number) FROM stdin;
    relational_schema               postgres    false    222   Zq       l          0    33469    customer 
   TABLE DATA           �   COPY relational_schema.customer (customer_id, registration_date, first_name, last_name, id_type, address, password) FROM stdin;
    relational_schema               postgres    false    223   �q       m          0    33474    employee 
   TABLE DATA           �   COPY relational_schema.employee (employee_ssn, first_name, last_name, address, "position", hotel_id, chain_id, password) FROM stdin;
    relational_schema               postgres    false    224   r       n          0    33479    has 
   TABLE DATA           t   COPY relational_schema.has (booking_start_date, room_num, customer_id, card_number, hotel_id, chain_id) FROM stdin;
    relational_schema               postgres    false    225   ,r       o          0    33484    holds 
   TABLE DATA           ^   COPY relational_schema.holds (archive_id, renting_start_date, booking_start_date) FROM stdin;
    relational_schema               postgres    false    226   Ir       p          0    33489    hotel 
   TABLE DATA           b   COPY relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) FROM stdin;
    relational_schema               postgres    false    227   fr       q          0    33494    hotel_chain 
   TABLE DATA           T   COPY relational_schema.hotel_chain (chain_id, chain_name, num_of_hotel) FROM stdin;
    relational_schema               postgres    false    228   �t       r          0    33499    hotel_email 
   TABLE DATA           M   COPY relational_schema.hotel_email (chain_id, hotel_id, h_email) FROM stdin;
    relational_schema               postgres    false    229   u       s          0    33504    hotel_phone 
   TABLE DATA           T   COPY relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) FROM stdin;
    relational_schema               postgres    false    230   v       t          0    33507    manager 
   TABLE DATA           q   COPY relational_schema.manager (ssn, "position", hotel_id, chain_id, first_name, last_name, address) FROM stdin;
    relational_schema               postgres    false    231   Qw       u          0    33512    payment 
   TABLE DATA           X   COPY relational_schema.payment (card_number, cvv, expiry_date, customer_id) FROM stdin;
    relational_schema               postgres    false    232   nw       v          0    33517    renting 
   TABLE DATA           {   COPY relational_schema.renting (start_date, end_date, room_num, customer_id, employee_ssn, hotel_id, chain_id) FROM stdin;
    relational_schema               postgres    false    233   �w       w          0    33522    room 
   TABLE DATA           j   COPY relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) FROM stdin;
    relational_schema               postgres    false    234   �w       x          0    33527    room_amenity 
   TABLE DATA           X   COPY relational_schema.room_amenity (room_num, hotel_id, chain_id, amenity) FROM stdin;
    relational_schema               postgres    false    235   �|       y          0    33532    room_damage 
   TABLE DATA           V   COPY relational_schema.room_damage (room_num, hotel_id, chain_id, damage) FROM stdin;
    relational_schema               postgres    false    236   �|       �           2606    33538    archive archive_id 
   CONSTRAINT     c   ALTER TABLE ONLY relational_schema.archive
    ADD CONSTRAINT archive_id PRIMARY KEY (archive_id);
 G   ALTER TABLE ONLY relational_schema.archive DROP CONSTRAINT archive_id;
       relational_schema                 postgres    false    218            �           2606    33540    booking booking_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY relational_schema.booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (booking_start_date, room_num, hotel_id, chain_id);
 I   ALTER TABLE ONLY relational_schema.booking DROP CONSTRAINT booking_pkey;
       relational_schema                 postgres    false    219    219    219    219            �           2606    33542    chain_address c_address 
   CONSTRAINT     q   ALTER TABLE ONLY relational_schema.chain_address
    ADD CONSTRAINT c_address PRIMARY KEY (c_address, chain_id);
 L   ALTER TABLE ONLY relational_schema.chain_address DROP CONSTRAINT c_address;
       relational_schema                 postgres    false    220    220            �           2606    33544    chain_email c_email 
   CONSTRAINT     k   ALTER TABLE ONLY relational_schema.chain_email
    ADD CONSTRAINT c_email PRIMARY KEY (c_email, chain_id);
 H   ALTER TABLE ONLY relational_schema.chain_email DROP CONSTRAINT c_email;
       relational_schema                 postgres    false    221    221            �           2606    33546    chain_number c_phone_number 
   CONSTRAINT     z   ALTER TABLE ONLY relational_schema.chain_number
    ADD CONSTRAINT c_phone_number PRIMARY KEY (c_phone_number, chain_id);
 P   ALTER TABLE ONLY relational_schema.chain_number DROP CONSTRAINT c_phone_number;
       relational_schema                 postgres    false    222    222            �           2606    33548    hotel_chain chain_id 
   CONSTRAINT     c   ALTER TABLE ONLY relational_schema.hotel_chain
    ADD CONSTRAINT chain_id PRIMARY KEY (chain_id);
 I   ALTER TABLE ONLY relational_schema.hotel_chain DROP CONSTRAINT chain_id;
       relational_schema                 postgres    false    228            �           2606    33550    customer customer_id 
   CONSTRAINT     f   ALTER TABLE ONLY relational_schema.customer
    ADD CONSTRAINT customer_id PRIMARY KEY (customer_id);
 I   ALTER TABLE ONLY relational_schema.customer DROP CONSTRAINT customer_id;
       relational_schema                 postgres    false    223            �           2606    33552    employee employee_ssn 
   CONSTRAINT     h   ALTER TABLE ONLY relational_schema.employee
    ADD CONSTRAINT employee_ssn PRIMARY KEY (employee_ssn);
 J   ALTER TABLE ONLY relational_schema.employee DROP CONSTRAINT employee_ssn;
       relational_schema                 postgres    false    224            �           2606    33554    hotel_email h_email_pk 
   CONSTRAINT     x   ALTER TABLE ONLY relational_schema.hotel_email
    ADD CONSTRAINT h_email_pk PRIMARY KEY (h_email, chain_id, hotel_id);
 K   ALTER TABLE ONLY relational_schema.hotel_email DROP CONSTRAINT h_email_pk;
       relational_schema                 postgres    false    229    229    229            �           2606    33556    hotel_phone h_phone_number_pk 
   CONSTRAINT     �   ALTER TABLE ONLY relational_schema.hotel_phone
    ADD CONSTRAINT h_phone_number_pk PRIMARY KEY (h_phone_number, chain_id, hotel_id);
 R   ALTER TABLE ONLY relational_schema.hotel_phone DROP CONSTRAINT h_phone_number_pk;
       relational_schema                 postgres    false    230    230    230            �           2606    33558    has has_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY relational_schema.has
    ADD CONSTRAINT has_pkey PRIMARY KEY (booking_start_date, room_num, hotel_id, chain_id);
 A   ALTER TABLE ONLY relational_schema.has DROP CONSTRAINT has_pkey;
       relational_schema                 postgres    false    225    225    225    225            �           2606    33560    holds holds_pk 
   CONSTRAINT     �   ALTER TABLE ONLY relational_schema.holds
    ADD CONSTRAINT holds_pk PRIMARY KEY (booking_start_date, renting_start_date, archive_id);
 C   ALTER TABLE ONLY relational_schema.holds DROP CONSTRAINT holds_pk;
       relational_schema                 postgres    false    226    226    226            �           2606    33562    hotel hotel_pk 
   CONSTRAINT     g   ALTER TABLE ONLY relational_schema.hotel
    ADD CONSTRAINT hotel_pk PRIMARY KEY (hotel_id, chain_id);
 C   ALTER TABLE ONLY relational_schema.hotel DROP CONSTRAINT hotel_pk;
       relational_schema                 postgres    false    227    227            �           2606    33564    manager manager_pk 
   CONSTRAINT     p   ALTER TABLE ONLY relational_schema.manager
    ADD CONSTRAINT manager_pk PRIMARY KEY (ssn, hotel_id, chain_id);
 G   ALTER TABLE ONLY relational_schema.manager DROP CONSTRAINT manager_pk;
       relational_schema                 postgres    false    231    231    231            �           2606    33566    payment payment_pk 
   CONSTRAINT     d   ALTER TABLE ONLY relational_schema.payment
    ADD CONSTRAINT payment_pk PRIMARY KEY (card_number);
 G   ALTER TABLE ONLY relational_schema.payment DROP CONSTRAINT payment_pk;
       relational_schema                 postgres    false    232            �           2606    33568    renting renting_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY relational_schema.renting
    ADD CONSTRAINT renting_pkey PRIMARY KEY (start_date, room_num, hotel_id, chain_id);
 I   ALTER TABLE ONLY relational_schema.renting DROP CONSTRAINT renting_pkey;
       relational_schema                 postgres    false    233    233    233    233            �           2606    33570    room_amenity room_amenity_pk 
   CONSTRAINT     �   ALTER TABLE ONLY relational_schema.room_amenity
    ADD CONSTRAINT room_amenity_pk PRIMARY KEY (hotel_id, chain_id, room_num, amenity);
 Q   ALTER TABLE ONLY relational_schema.room_amenity DROP CONSTRAINT room_amenity_pk;
       relational_schema                 postgres    false    235    235    235    235            �           2606    33572    room_damage room_damage_pk 
   CONSTRAINT     �   ALTER TABLE ONLY relational_schema.room_damage
    ADD CONSTRAINT room_damage_pk PRIMARY KEY (room_num, chain_id, hotel_id, damage);
 O   ALTER TABLE ONLY relational_schema.room_damage DROP CONSTRAINT room_damage_pk;
       relational_schema                 postgres    false    236    236    236    236            �           2606    33574    room room_pk 
   CONSTRAINT     o   ALTER TABLE ONLY relational_schema.room
    ADD CONSTRAINT room_pk PRIMARY KEY (room_num, chain_id, hotel_id);
 A   ALTER TABLE ONLY relational_schema.room DROP CONSTRAINT room_pk;
       relational_schema                 postgres    false    234    234    234            �           2606    33575     booking booking_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.booking
    ADD CONSTRAINT booking_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES relational_schema.customer(customer_id);
 U   ALTER TABLE ONLY relational_schema.booking DROP CONSTRAINT booking_customer_id_fkey;
       relational_schema               postgres    false    219    223    4778            �           2606    33580 /   booking booking_room_num_hotel_id_chain_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.booking
    ADD CONSTRAINT booking_room_num_hotel_id_chain_id_fkey FOREIGN KEY (room_num, hotel_id, chain_id) REFERENCES relational_schema.room(room_num, hotel_id, chain_id);
 d   ALTER TABLE ONLY relational_schema.booking DROP CONSTRAINT booking_room_num_hotel_id_chain_id_fkey;
       relational_schema               postgres    false    4800    219    219    219    234    234    234            �           2606    33585 3   chain_address chain_address_hotel_chain_chain_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.chain_address
    ADD CONSTRAINT chain_address_hotel_chain_chain_id_fk FOREIGN KEY (chain_id) REFERENCES relational_schema.hotel_chain(chain_id);
 h   ALTER TABLE ONLY relational_schema.chain_address DROP CONSTRAINT chain_address_hotel_chain_chain_id_fk;
       relational_schema               postgres    false    220    4788    228            �           2606    33590 /   chain_email chain_email_hotel_chain_chain_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.chain_email
    ADD CONSTRAINT chain_email_hotel_chain_chain_id_fk FOREIGN KEY (chain_id) REFERENCES relational_schema.hotel_chain(chain_id);
 d   ALTER TABLE ONLY relational_schema.chain_email DROP CONSTRAINT chain_email_hotel_chain_chain_id_fk;
       relational_schema               postgres    false    228    221    4788            �           2606    33595 1   chain_number chain_number_hotel_chain_chain_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.chain_number
    ADD CONSTRAINT chain_number_hotel_chain_chain_id_fk FOREIGN KEY (chain_id) REFERENCES relational_schema.hotel_chain(chain_id);
 f   ALTER TABLE ONLY relational_schema.chain_number DROP CONSTRAINT chain_number_hotel_chain_chain_id_fk;
       relational_schema               postgres    false    228    222    4788            �           2606    33600 ,   employee employee_hotel_hotel_id_chain_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.employee
    ADD CONSTRAINT employee_hotel_hotel_id_chain_id_fk FOREIGN KEY (hotel_id, chain_id) REFERENCES relational_schema.hotel(hotel_id, chain_id);
 a   ALTER TABLE ONLY relational_schema.employee DROP CONSTRAINT employee_hotel_hotel_id_chain_id_fk;
       relational_schema               postgres    false    224    227    4786    224    227            �           2606    33605    has has_card_number_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.has
    ADD CONSTRAINT has_card_number_fkey FOREIGN KEY (card_number) REFERENCES relational_schema.payment(card_number);
 M   ALTER TABLE ONLY relational_schema.has DROP CONSTRAINT has_card_number_fkey;
       relational_schema               postgres    false    225    4796    232            �           2606    33610    has has_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.has
    ADD CONSTRAINT has_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES relational_schema.customer(customer_id);
 M   ALTER TABLE ONLY relational_schema.has DROP CONSTRAINT has_customer_id_fkey;
       relational_schema               postgres    false    223    225    4778            �           2606    33615 '   has has_room_num_hotel_id_chain_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.has
    ADD CONSTRAINT has_room_num_hotel_id_chain_id_fkey FOREIGN KEY (room_num, hotel_id, chain_id) REFERENCES relational_schema.room(room_num, hotel_id, chain_id);
 \   ALTER TABLE ONLY relational_schema.has DROP CONSTRAINT has_room_num_hotel_id_chain_id_fkey;
       relational_schema               postgres    false    234    234    225    225    225    4800    234            �           2606    33620    hotel hotel_chain_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.hotel
    ADD CONSTRAINT hotel_chain_id_fkey FOREIGN KEY (chain_id) REFERENCES relational_schema.hotel_chain(chain_id);
 N   ALTER TABLE ONLY relational_schema.hotel DROP CONSTRAINT hotel_chain_id_fkey;
       relational_schema               postgres    false    4788    228    227            �           2606    33625 2   hotel_email hotel_email_hotel_chain_id_hotel_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.hotel_email
    ADD CONSTRAINT hotel_email_hotel_chain_id_hotel_id_fk FOREIGN KEY (chain_id, hotel_id) REFERENCES relational_schema.hotel(chain_id, hotel_id);
 g   ALTER TABLE ONLY relational_schema.hotel_email DROP CONSTRAINT hotel_email_hotel_chain_id_hotel_id_fk;
       relational_schema               postgres    false    4786    229    229    227    227            �           2606    33630 2   hotel_phone hotel_phone_hotel_chain_id_hotel_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.hotel_phone
    ADD CONSTRAINT hotel_phone_hotel_chain_id_hotel_id_fk FOREIGN KEY (chain_id, hotel_id) REFERENCES relational_schema.hotel(chain_id, hotel_id);
 g   ALTER TABLE ONLY relational_schema.hotel_phone DROP CONSTRAINT hotel_phone_hotel_chain_id_hotel_id_fk;
       relational_schema               postgres    false    4786    230    230    227    227            �           2606    33635 '   payment payment_customer_customer_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.payment
    ADD CONSTRAINT payment_customer_customer_id_fk FOREIGN KEY (customer_id) REFERENCES relational_schema.customer(customer_id);
 \   ALTER TABLE ONLY relational_schema.payment DROP CONSTRAINT payment_customer_customer_id_fk;
       relational_schema               postgres    false    223    4778    232            �           2606    33640     renting renting_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.renting
    ADD CONSTRAINT renting_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES relational_schema.customer(customer_id);
 U   ALTER TABLE ONLY relational_schema.renting DROP CONSTRAINT renting_customer_id_fkey;
       relational_schema               postgres    false    233    223    4778            �           2606    33645 !   renting renting_employee_ssn_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.renting
    ADD CONSTRAINT renting_employee_ssn_fkey FOREIGN KEY (employee_ssn) REFERENCES relational_schema.employee(employee_ssn);
 V   ALTER TABLE ONLY relational_schema.renting DROP CONSTRAINT renting_employee_ssn_fkey;
       relational_schema               postgres    false    224    4780    233            �           2606    33650 /   renting renting_room_num_hotel_id_chain_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.renting
    ADD CONSTRAINT renting_room_num_hotel_id_chain_id_fkey FOREIGN KEY (room_num, hotel_id, chain_id) REFERENCES relational_schema.room(room_num, hotel_id, chain_id);
 d   ALTER TABLE ONLY relational_schema.renting DROP CONSTRAINT renting_room_num_hotel_id_chain_id_fkey;
       relational_schema               postgres    false    233    234    234    233    233    234    4800            �           2606    33655 $   room room_hotel_hotel_id_chain_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.room
    ADD CONSTRAINT room_hotel_hotel_id_chain_id_fk FOREIGN KEY (hotel_id, chain_id) REFERENCES relational_schema.hotel(hotel_id, chain_id);
 Y   ALTER TABLE ONLY relational_schema.room DROP CONSTRAINT room_hotel_hotel_id_chain_id_fk;
       relational_schema               postgres    false    227    234    227    4786    234            g      x������ � �      h      x������ � �      i   H   x�34261��/��+��q�8�KJ��@lsN���̜��<.ς�;3/���,9�3�R��b���� 0�	      j   W   x�34261����)����K�w�0�@�f�9�EE��%%`�$e�Y�]�
1�@B�����`1�$d�Y\�XQdp��qqq �O&      k   >   x�Ʊ�0��&g �K��#�F�HVK�kL��oHX�o1�8��b�кz��D�<[|���      l   W   x���tH�M���K���.�S�M,R06P04�26�20Upu	Q0202�,��K�����t)�,K-R/V��LN�+N�,�������� �v�      m      x������ � �      n      x������ � �      o      x������ � �      p   6  x��T�n�0}�~_-�M��*[%i����R_p�+c6��;�a(K:��s;�D�I*@��g�HD���D������$m�I]�����P��@�l������
#R�}K�E��F�g�!���K�5�8��ܻ1�8g��B�m#Awg%�W�q�QT�!� ��q��f<��XWo��#���[2���5�Ji����&6;�͙\����Uƹ�4�<��+h'@H#��t>�:�W]��G�z$�5����s�I5�<[ykVx��Ǔ��`bσ];����Y�p߶�!���=b;X�w�K��榷S�,�?!��v�=�m���X����5��k�I3���ټ��3:xAo&��2�_���m�|���}VE�D����͔jt�.���N7���it	���̭��jȇO=xoS�Z+8I=0��
 �,�}4=^�9ts�`_����<��K�C�m.]����P�g�`�S<����;���/��/:p���1}���W��|A$�m֍�^Q�U��<�i�W�`乌�4���(5���������W������r      q   W   x�34261����)������8}��2�KJ8-�@|s����T���Ԝb�"���cqr>���c�\�X�����ih����� ��      r   �   x�]��n�0���D6������B�����Ͷ�Ǚ�C��a���R�}e�S����§J\e9�E�1���"5m�~�}1���_ADO�/��Q���^C������Ȕ7��Tu8Wwu�[��)oY���p��꼷z�)Ϭ�Tu8Wwu�[��)�X���p��꼷z/S޳S��\��yo�A�|`��ù:�����L��:LU�supW�Ե1ɔO�з��[������@,      s   0  x�U�K�� �z�)@>z���9� �r�E^+ʢ�"�����4���b�gEԳt"-O7��B{Վ=}���&�;)XXΧ,!�񫤨��w�ʊ���u�+{�i*+V�ÿ�5�Y[V*�OY�����Me�f��Pu�P*+F�ʊ��_eŞ}۲Q$�5���;؊6��b!�ɫ��K*{6A*5jܛ7�SV|�{>��S*+6=���͟ҢƓ|d���bd��lط�ʊ�<�UVL��U�`���0���b�TV{IeYv/�D����3��c��ba���3��d��	      t      x������ � �      u      x������ � �      v      x������ � �      w   �  x���Q��0D��)�[qC����5�UlP�{�M�8t˒���і�,��܎�����:�N����t8�����	]�6��4C���M�|^���t�~��~	�y?��o_��gv�5�������u�``ň��t��A!���rLl�8?M?C��Ɋ�Zf��`�B���8|����	��dl	����gI����#�?W���O�'�L|2�p��w(r����O33�iN)�bJ��y"�I���g��S�C�L��ՙv������_�����y����G����Y��uK#co�i�q~�D{mI��ǩ �SFŠ���P�*���	C|�.�e��>�#�Fh0��r#�[3��<�\��B����B��G�J�
s��	<�>�?aZ�-C��&:04h��Fb��.����2�7�n��LNJ{���3b��k��$-�U#��r�j���
��Wr�����5���?��ȡ�B�=���3"�#��=��!c�Ȩ��Z���o-g�r�-W�k�� 2��Ō�T�����s۱�Ȍ�!��#!���m�Ο|Z�9�EE�=T�]jfo,Ĵh��!�X{>b���#�Ȟ�RĪO�\(���v\������ىT/�̼-q8�yjX�ˆ��0cX�!�lB�M��*v`�:m��K��{�/(�������o�����L���Z��; +E/V�S��
r��ϙ/@Ε��2��q1�^l�ƭ9$�؊#s����`����r�d\x=ś�3�f�b{Q�]�j��,-[�_�>c��5CL��5���A�74�9��;u�m�A-7��F��ƦD��������X��/.<7#��Nӿ�U|SA��e�{��M�u&d&�f=I�'�x���opYȱBJ=�3ΈcΨ�\e���8Ba���� m��$0��9H��B,��X���Ĩ7��Օ(0Yg��`!V����-̺,&�BMh�M芡��ЉրhD7�hFU,��@/vj��ٌ:وn�Ѝf�F;�(q�zq�JF1��ч���d1��B�M����+�BV��EA�_�g.�\Y�.H�_����#�V�>�SE�#Y�z�[vO˟b� �����Dv�w_p�t����i�3�Ў�<��-ZpК Q}F�Y t^���4Z4�tt�*4r��c��Åo�+��[�~υ����B����ݪ���ш��j��w4j[����c�u_�&���f�X���      x      x������ � �      y      x������ � �     