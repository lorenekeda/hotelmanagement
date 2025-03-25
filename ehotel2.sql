PGDMP                      }        
   hotelchain    17.2    17.2 J    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16424 
   hotelchain    DATABASE     l   CREATE DATABASE hotelchain WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE hotelchain;
                     postgres    false            �           0    0    SCHEMA public    ACL     +   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
                        pg_database_owner    false    6                        2615    16736    relational_schema    SCHEMA     !   CREATE SCHEMA relational_schema;
    DROP SCHEMA relational_schema;
                     postgres    false            �            1259    16737    archive    TABLE     L   CREATE TABLE relational_schema.archive (
    archive_id integer NOT NULL
);
 &   DROP TABLE relational_schema.archive;
       relational_schema         heap r       postgres    false    5            �            1259    16740    booking    TABLE     �   CREATE TABLE relational_schema.booking (
    booking_start_date character varying NOT NULL,
    booking_end_date character varying,
    room_num integer,
    customer_id character varying,
    hotel_id integer NOT NULL,
    chain_id integer NOT NULL
);
 &   DROP TABLE relational_schema.booking;
       relational_schema         heap r       postgres    false    5            �            1259    16745    chain_address    TABLE     z   CREATE TABLE relational_schema.chain_address (
    chain_id integer NOT NULL,
    c_address character varying NOT NULL
);
 ,   DROP TABLE relational_schema.chain_address;
       relational_schema         heap r       postgres    false    5            �            1259    16750    chain_email    TABLE     v   CREATE TABLE relational_schema.chain_email (
    chain_id integer NOT NULL,
    c_email character varying NOT NULL
);
 *   DROP TABLE relational_schema.chain_email;
       relational_schema         heap r       postgres    false    5            �            1259    16755    chain_number    TABLE     s   CREATE TABLE relational_schema.chain_number (
    chain_id integer NOT NULL,
    c_phone_number bigint NOT NULL
);
 +   DROP TABLE relational_schema.chain_number;
       relational_schema         heap r       postgres    false    5            �            1259    16758    customer    TABLE       CREATE TABLE relational_schema.customer (
    customer_id character varying NOT NULL,
    registration_date character varying,
    first_name character varying,
    last_name character varying,
    id_type character varying,
    address character varying
);
 '   DROP TABLE relational_schema.customer;
       relational_schema         heap r       postgres    false    5            �            1259    16763    employee    TABLE     �   CREATE TABLE relational_schema.employee (
    employee_ssn integer NOT NULL,
    first_name character varying,
    last_name character varying,
    address character varying,
    "position" character varying,
    hotel_id integer,
    chain_id integer
);
 '   DROP TABLE relational_schema.employee;
       relational_schema         heap r       postgres    false    5            �            1259    16768    holds    TABLE     �   CREATE TABLE relational_schema.holds (
    archive_id integer NOT NULL,
    renting_start_date character varying NOT NULL,
    booking_start_date character varying NOT NULL
);
 $   DROP TABLE relational_schema.holds;
       relational_schema         heap r       postgres    false    5            �            1259    16773    hotel    TABLE     �   CREATE TABLE relational_schema.hotel (
    hotel_id integer NOT NULL,
    chain_id integer NOT NULL,
    address character varying,
    name character varying,
    rating integer,
    num_of_room character varying
);
 $   DROP TABLE relational_schema.hotel;
       relational_schema         heap r       postgres    false    5            �            1259    16778    hotel_chain    TABLE     �   CREATE TABLE relational_schema.hotel_chain (
    chain_id integer NOT NULL,
    chain_name character varying,
    num_of_hotel integer
);
 *   DROP TABLE relational_schema.hotel_chain;
       relational_schema         heap r       postgres    false    5            �            1259    16783    hotel_email    TABLE     �   CREATE TABLE relational_schema.hotel_email (
    chain_id integer NOT NULL,
    hotel_id integer NOT NULL,
    h_email character varying NOT NULL
);
 *   DROP TABLE relational_schema.hotel_email;
       relational_schema         heap r       postgres    false    5            �            1259    16788    hotel_phone    TABLE     �   CREATE TABLE relational_schema.hotel_phone (
    chain_id integer NOT NULL,
    hotel_id integer NOT NULL,
    h_phone_number bigint NOT NULL
);
 *   DROP TABLE relational_schema.hotel_phone;
       relational_schema         heap r       postgres    false    5            �            1259    16791    manager    TABLE       CREATE TABLE relational_schema.manager (
    ssn integer NOT NULL,
    "position" character varying,
    hotel_id integer NOT NULL,
    chain_id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    address character varying
);
 &   DROP TABLE relational_schema.manager;
       relational_schema         heap r       postgres    false    5            �            1259    16923    payment    TABLE     �   CREATE TABLE relational_schema.payment (
    card_number integer NOT NULL,
    cvv integer,
    expiry_date character varying,
    customer_id character varying
);
 &   DROP TABLE relational_schema.payment;
       relational_schema         heap r       postgres    false    5            �            1259    16796    renting    TABLE       CREATE TABLE relational_schema.renting (
    start_date character varying NOT NULL,
    end_date character varying,
    room_num integer,
    customer_id character varying,
    employee_ssn integer,
    chain_id integer NOT NULL,
    hotel_id integer NOT NULL
);
 &   DROP TABLE relational_schema.renting;
       relational_schema         heap r       postgres    false    5            �            1259    16801    room    TABLE     �   CREATE TABLE relational_schema.room (
    room_num integer NOT NULL,
    view character varying,
    extendable boolean,
    capacity character varying,
    price integer,
    hotel_id integer NOT NULL,
    chain_id integer NOT NULL
);
 #   DROP TABLE relational_schema.room;
       relational_schema         heap r       postgres    false    5            �            1259    16806    room_amenity    TABLE     �   CREATE TABLE relational_schema.room_amenity (
    room_num integer NOT NULL,
    hotel_id integer NOT NULL,
    chain_id integer NOT NULL,
    amenity character varying NOT NULL
);
 +   DROP TABLE relational_schema.room_amenity;
       relational_schema         heap r       postgres    false    5            �            1259    16811    room_damage    TABLE     �   CREATE TABLE relational_schema.room_damage (
    room_num integer NOT NULL,
    hotel_id integer NOT NULL,
    chain_id integer NOT NULL,
    damage character varying NOT NULL
);
 *   DROP TABLE relational_schema.room_damage;
       relational_schema         heap r       postgres    false    5            �          0    16737    archive 
   TABLE DATA                 relational_schema               postgres    false    218   3`       �          0    16740    booking 
   TABLE DATA                 relational_schema               postgres    false    219   M`       �          0    16745    chain_address 
   TABLE DATA                 relational_schema               postgres    false    220   g`       �          0    16750    chain_email 
   TABLE DATA                 relational_schema               postgres    false    221   a       �          0    16755    chain_number 
   TABLE DATA                 relational_schema               postgres    false    222   �a       �          0    16758    customer 
   TABLE DATA                 relational_schema               postgres    false    223   gb       �          0    16763    employee 
   TABLE DATA                 relational_schema               postgres    false    224   �b       �          0    16768    holds 
   TABLE DATA                 relational_schema               postgres    false    225   �b       �          0    16773    hotel 
   TABLE DATA                 relational_schema               postgres    false    226   �b       �          0    16778    hotel_chain 
   TABLE DATA                 relational_schema               postgres    false    227   �e       �          0    16783    hotel_email 
   TABLE DATA                 relational_schema               postgres    false    228   ff       �          0    16788    hotel_phone 
   TABLE DATA                 relational_schema               postgres    false    229   �g       �          0    16791    manager 
   TABLE DATA                 relational_schema               postgres    false    230   �i       �          0    16923    payment 
   TABLE DATA                 relational_schema               postgres    false    235   �i       �          0    16796    renting 
   TABLE DATA                 relational_schema               postgres    false    231   j       �          0    16801    room 
   TABLE DATA                 relational_schema               postgres    false    232   j       �          0    16806    room_amenity 
   TABLE DATA                 relational_schema               postgres    false    233   |p       �          0    16811    room_damage 
   TABLE DATA                 relational_schema               postgres    false    234   �p       �           2606    16817    archive archive_id 
   CONSTRAINT     c   ALTER TABLE ONLY relational_schema.archive
    ADD CONSTRAINT archive_id PRIMARY KEY (archive_id);
 G   ALTER TABLE ONLY relational_schema.archive DROP CONSTRAINT archive_id;
       relational_schema                 postgres    false    218            �           2606    16819    booking booking_start_date 
   CONSTRAINT     �   ALTER TABLE ONLY relational_schema.booking
    ADD CONSTRAINT booking_start_date PRIMARY KEY (booking_start_date, hotel_id, chain_id);
 O   ALTER TABLE ONLY relational_schema.booking DROP CONSTRAINT booking_start_date;
       relational_schema                 postgres    false    219    219    219            �           2606    16821    chain_address c_address 
   CONSTRAINT     q   ALTER TABLE ONLY relational_schema.chain_address
    ADD CONSTRAINT c_address PRIMARY KEY (c_address, chain_id);
 L   ALTER TABLE ONLY relational_schema.chain_address DROP CONSTRAINT c_address;
       relational_schema                 postgres    false    220    220            �           2606    16823    chain_email c_email 
   CONSTRAINT     k   ALTER TABLE ONLY relational_schema.chain_email
    ADD CONSTRAINT c_email PRIMARY KEY (c_email, chain_id);
 H   ALTER TABLE ONLY relational_schema.chain_email DROP CONSTRAINT c_email;
       relational_schema                 postgres    false    221    221            �           2606    16825    chain_number c_phone_number 
   CONSTRAINT     z   ALTER TABLE ONLY relational_schema.chain_number
    ADD CONSTRAINT c_phone_number PRIMARY KEY (c_phone_number, chain_id);
 P   ALTER TABLE ONLY relational_schema.chain_number DROP CONSTRAINT c_phone_number;
       relational_schema                 postgres    false    222    222            �           2606    16827    hotel_chain chain_id 
   CONSTRAINT     c   ALTER TABLE ONLY relational_schema.hotel_chain
    ADD CONSTRAINT chain_id PRIMARY KEY (chain_id);
 I   ALTER TABLE ONLY relational_schema.hotel_chain DROP CONSTRAINT chain_id;
       relational_schema                 postgres    false    227            �           2606    16829    customer customer_id 
   CONSTRAINT     f   ALTER TABLE ONLY relational_schema.customer
    ADD CONSTRAINT customer_id PRIMARY KEY (customer_id);
 I   ALTER TABLE ONLY relational_schema.customer DROP CONSTRAINT customer_id;
       relational_schema                 postgres    false    223            �           2606    16831    employee employee_ssn 
   CONSTRAINT     h   ALTER TABLE ONLY relational_schema.employee
    ADD CONSTRAINT employee_ssn PRIMARY KEY (employee_ssn);
 J   ALTER TABLE ONLY relational_schema.employee DROP CONSTRAINT employee_ssn;
       relational_schema                 postgres    false    224            �           2606    16833    hotel_email h_email_pk 
   CONSTRAINT     x   ALTER TABLE ONLY relational_schema.hotel_email
    ADD CONSTRAINT h_email_pk PRIMARY KEY (h_email, chain_id, hotel_id);
 K   ALTER TABLE ONLY relational_schema.hotel_email DROP CONSTRAINT h_email_pk;
       relational_schema                 postgres    false    228    228    228            �           2606    16835    hotel_phone h_phone_number_pk 
   CONSTRAINT     �   ALTER TABLE ONLY relational_schema.hotel_phone
    ADD CONSTRAINT h_phone_number_pk PRIMARY KEY (h_phone_number, chain_id, hotel_id);
 R   ALTER TABLE ONLY relational_schema.hotel_phone DROP CONSTRAINT h_phone_number_pk;
       relational_schema                 postgres    false    229    229    229            �           2606    16837    holds holds_pk 
   CONSTRAINT     �   ALTER TABLE ONLY relational_schema.holds
    ADD CONSTRAINT holds_pk PRIMARY KEY (booking_start_date, renting_start_date, archive_id);
 C   ALTER TABLE ONLY relational_schema.holds DROP CONSTRAINT holds_pk;
       relational_schema                 postgres    false    225    225    225            �           2606    16839    hotel hotel_pk 
   CONSTRAINT     g   ALTER TABLE ONLY relational_schema.hotel
    ADD CONSTRAINT hotel_pk PRIMARY KEY (hotel_id, chain_id);
 C   ALTER TABLE ONLY relational_schema.hotel DROP CONSTRAINT hotel_pk;
       relational_schema                 postgres    false    226    226            �           2606    16841    manager manager_pk 
   CONSTRAINT     p   ALTER TABLE ONLY relational_schema.manager
    ADD CONSTRAINT manager_pk PRIMARY KEY (ssn, hotel_id, chain_id);
 G   ALTER TABLE ONLY relational_schema.manager DROP CONSTRAINT manager_pk;
       relational_schema                 postgres    false    230    230    230            �           2606    16929    payment payment_pk 
   CONSTRAINT     d   ALTER TABLE ONLY relational_schema.payment
    ADD CONSTRAINT payment_pk PRIMARY KEY (card_number);
 G   ALTER TABLE ONLY relational_schema.payment DROP CONSTRAINT payment_pk;
       relational_schema                 postgres    false    235            �           2606    16843    renting renting_start_date 
   CONSTRAINT        ALTER TABLE ONLY relational_schema.renting
    ADD CONSTRAINT renting_start_date PRIMARY KEY (start_date, hotel_id, chain_id);
 O   ALTER TABLE ONLY relational_schema.renting DROP CONSTRAINT renting_start_date;
       relational_schema                 postgres    false    231    231    231            �           2606    16845    room_amenity room_amenity_pk 
   CONSTRAINT     �   ALTER TABLE ONLY relational_schema.room_amenity
    ADD CONSTRAINT room_amenity_pk PRIMARY KEY (hotel_id, chain_id, room_num, amenity);
 Q   ALTER TABLE ONLY relational_schema.room_amenity DROP CONSTRAINT room_amenity_pk;
       relational_schema                 postgres    false    233    233    233    233            �           2606    16847    room_damage room_damage_pk 
   CONSTRAINT     �   ALTER TABLE ONLY relational_schema.room_damage
    ADD CONSTRAINT room_damage_pk PRIMARY KEY (room_num, chain_id, hotel_id, damage);
 O   ALTER TABLE ONLY relational_schema.room_damage DROP CONSTRAINT room_damage_pk;
       relational_schema                 postgres    false    234    234    234    234            �           2606    16849    room room_pk 
   CONSTRAINT     o   ALTER TABLE ONLY relational_schema.room
    ADD CONSTRAINT room_pk PRIMARY KEY (room_num, chain_id, hotel_id);
 A   ALTER TABLE ONLY relational_schema.room DROP CONSTRAINT room_pk;
       relational_schema                 postgres    false    232    232    232            �           2606    16850    booking booking_customer_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.booking
    ADD CONSTRAINT booking_customer_id_fk FOREIGN KEY (customer_id) REFERENCES relational_schema.customer(customer_id);
 S   ALTER TABLE ONLY relational_schema.booking DROP CONSTRAINT booking_customer_id_fk;
       relational_schema               postgres    false    219    3529    223            �           2606    16855 2   booking booking_room_chain_id_hotel_id_room_num_fk    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.booking
    ADD CONSTRAINT booking_room_chain_id_hotel_id_room_num_fk FOREIGN KEY (chain_id, hotel_id, room_num) REFERENCES relational_schema.room(chain_id, hotel_id, room_num);
 g   ALTER TABLE ONLY relational_schema.booking DROP CONSTRAINT booking_room_chain_id_hotel_id_room_num_fk;
       relational_schema               postgres    false    232    219    219    232    232    3547    219            �           2606    16860 3   chain_address chain_address_hotel_chain_chain_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.chain_address
    ADD CONSTRAINT chain_address_hotel_chain_chain_id_fk FOREIGN KEY (chain_id) REFERENCES relational_schema.hotel_chain(chain_id);
 h   ALTER TABLE ONLY relational_schema.chain_address DROP CONSTRAINT chain_address_hotel_chain_chain_id_fk;
       relational_schema               postgres    false    220    3537    227            �           2606    16865 /   chain_email chain_email_hotel_chain_chain_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.chain_email
    ADD CONSTRAINT chain_email_hotel_chain_chain_id_fk FOREIGN KEY (chain_id) REFERENCES relational_schema.hotel_chain(chain_id);
 d   ALTER TABLE ONLY relational_schema.chain_email DROP CONSTRAINT chain_email_hotel_chain_chain_id_fk;
       relational_schema               postgres    false    3537    221    227            �           2606    16870 1   chain_number chain_number_hotel_chain_chain_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.chain_number
    ADD CONSTRAINT chain_number_hotel_chain_chain_id_fk FOREIGN KEY (chain_id) REFERENCES relational_schema.hotel_chain(chain_id);
 f   ALTER TABLE ONLY relational_schema.chain_number DROP CONSTRAINT chain_number_hotel_chain_chain_id_fk;
       relational_schema               postgres    false    222    3537    227            �           2606    16875 ,   employee employee_hotel_hotel_id_chain_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.employee
    ADD CONSTRAINT employee_hotel_hotel_id_chain_id_fk FOREIGN KEY (hotel_id, chain_id) REFERENCES relational_schema.hotel(hotel_id, chain_id);
 a   ALTER TABLE ONLY relational_schema.employee DROP CONSTRAINT employee_hotel_hotel_id_chain_id_fk;
       relational_schema               postgres    false    3535    226    224    224    226            �           2606    16880    hotel hotel_chain_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.hotel
    ADD CONSTRAINT hotel_chain_id_fkey FOREIGN KEY (chain_id) REFERENCES relational_schema.hotel_chain(chain_id);
 N   ALTER TABLE ONLY relational_schema.hotel DROP CONSTRAINT hotel_chain_id_fkey;
       relational_schema               postgres    false    226    227    3537            �           2606    16885 2   hotel_email hotel_email_hotel_chain_id_hotel_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.hotel_email
    ADD CONSTRAINT hotel_email_hotel_chain_id_hotel_id_fk FOREIGN KEY (chain_id, hotel_id) REFERENCES relational_schema.hotel(chain_id, hotel_id);
 g   ALTER TABLE ONLY relational_schema.hotel_email DROP CONSTRAINT hotel_email_hotel_chain_id_hotel_id_fk;
       relational_schema               postgres    false    226    226    3535    228    228            �           2606    16890 2   hotel_phone hotel_phone_hotel_chain_id_hotel_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.hotel_phone
    ADD CONSTRAINT hotel_phone_hotel_chain_id_hotel_id_fk FOREIGN KEY (chain_id, hotel_id) REFERENCES relational_schema.hotel(chain_id, hotel_id);
 g   ALTER TABLE ONLY relational_schema.hotel_phone DROP CONSTRAINT hotel_phone_hotel_chain_id_hotel_id_fk;
       relational_schema               postgres    false    229    226    226    3535    229            �           2606    16930 '   payment payment_customer_customer_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.payment
    ADD CONSTRAINT payment_customer_customer_id_fk FOREIGN KEY (customer_id) REFERENCES relational_schema.customer(customer_id);
 \   ALTER TABLE ONLY relational_schema.payment DROP CONSTRAINT payment_customer_customer_id_fk;
       relational_schema               postgres    false    223    3529    235            �           2606    16895 '   renting renting_customer_customer_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.renting
    ADD CONSTRAINT renting_customer_customer_id_fk FOREIGN KEY (customer_id) REFERENCES relational_schema.customer(customer_id);
 \   ALTER TABLE ONLY relational_schema.renting DROP CONSTRAINT renting_customer_customer_id_fk;
       relational_schema               postgres    false    223    231    3529            �           2606    16900 (   renting renting_employee_employee_ssn_fk    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.renting
    ADD CONSTRAINT renting_employee_employee_ssn_fk FOREIGN KEY (employee_ssn) REFERENCES relational_schema.employee(employee_ssn);
 ]   ALTER TABLE ONLY relational_schema.renting DROP CONSTRAINT renting_employee_employee_ssn_fk;
       relational_schema               postgres    false    224    231    3531            �           2606    16905 2   renting renting_room_room_num_hotel_id_chain_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.renting
    ADD CONSTRAINT renting_room_room_num_hotel_id_chain_id_fk FOREIGN KEY (room_num, hotel_id, chain_id) REFERENCES relational_schema.room(room_num, hotel_id, chain_id);
 g   ALTER TABLE ONLY relational_schema.renting DROP CONSTRAINT renting_room_room_num_hotel_id_chain_id_fk;
       relational_schema               postgres    false    231    3547    232    232    232    231    231            �           2606    16910 $   room room_hotel_hotel_id_chain_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY relational_schema.room
    ADD CONSTRAINT room_hotel_hotel_id_chain_id_fk FOREIGN KEY (hotel_id, chain_id) REFERENCES relational_schema.hotel(hotel_id, chain_id);
 Y   ALTER TABLE ONLY relational_schema.room DROP CONSTRAINT room_hotel_hotel_id_chain_id_fk;
       relational_schema               postgres    false    3535    232    232    226    226            �   
   x���          �   
   x���          �   �   x��̽
�0@�Oq��P�'��Ai�F�%	6��B��M� �9�Ǻ��s`��)�A�E3z1�bBmG��)��������y�=���j��6Prrd���`��d�"އ��k'z����y���~�����	?F�����^_ט�      �   �   x���?�0G�~���B����С lu-G��0M ��7��7��~7�wM�������%:�
�`�4θ�<��"zU ⩄����;(���f[A>�tZ�z�sļ<eM�v>!��΅���pe�3��C�!����G+t�3�ӳ���;4�{�ϲ{8�V      �   �   x����
�@��>��p�t:u� �AZWٶ�t��O�aO�?|_ݴե���ΰ�Q��٩�ik&��V�w��n���@�������n�ӵj!�*���xNQ� 2���`�9xa����s��&%ʸd����D$(����L��      �   
   x���          �   
   x���          �   
   x���          �   �  x��YMo�0��+|�������	$TP)TM�jO葸�"�W�Cſ�g���ٓ��d��xf�O���O�fD�4��JsZ�M.4-���m����90���,�T��p(iD$~���*�c!�(�ɼ?y&�*6+"q���E��44��Zp���M�y��1���cVDz�w���W���(��D�$���k>���?���RP}�
|�y�`�?��/�[���$�.�3렰��:v�'U�S��{A��6�L����:!v]ǔhG�4/�%�zK����
�'k*���x**��wt~��v��h�/>���9Z����*�Zs�Œ�bM�	HɄ֡z�@=�\�P�A��6.�m����:�S
_P��N~	nu��T���jÊ�~��v���'���|r�7��=�NϯX>9�L*)�6�\Z�;���,1A��MvV���9�:2��������8�[��	�H���>��N樛9�3E���:��EJp�Z�c,$W�������sI8���-���I���Ӌ_LV���/�{fʌT��y�i�Uld�`[���&W�A%9,���A���� e ���,�/C�+��M�,*B��6�n;�tjkɲ�y�
:�	�K��?v�9�KR��R`>8�=��nj����Y3v��%�a%X���}�X�*E���K�}WO(��iKUk/AΨ���,�f�A&����/�-��-`VYb�i��"�3�����?��]      �   �   x���M
�0ཧ��
Aj��\��j�CL14&�Eo�Ğ!�7�>^���}��n`�D+�BI6��I[.)�P(H֠b$�Μ���T����³juI���⫐V��@���&�婣�Z4Fhk�V��<vrZ��r��n	;�{���i'�p��J�͢�3�压�c	��      �   g  x����k�0��EnmA����zFk�k	VP�*h.�ﷴ���{�D�o�����Q��㋘Z�L?J��k/�M�O�O��S�p�ϡ���>�>n������ �i�e(d$�������jn���1����Z��f�&&'�(��$��q�f������k3�r���j����h�b!��-Csq���m�n�Vb;N�����ɭ�Fnw㶒�qZ�o<��Hn4r+���Ԏ�R~+�yhDr+��[�ݸ�dv���[�C+ �[��
��m%�㴜�
xZ��
h�Vp7n+���V���
��V@#���q[)�8����V@$��܍����*;N��ww?Mɧ	�;� �)&iO      �   �  x����JCA��}��T��$s��Q�-U�P[���Nls��I)��#��d�.o��������1��_��~�[}�lƷ����5�V��~N^6��~�}=���;~���=���������pK=(�o�X�^,��ۄH5�H!�c"�-e�bbQԱF�1%�XqD�)�wGT`�3�#����(,ms��jB͜��)%�eg�9�[N 3��8�9�p�9��9�̜������*	n�'��8�4ƛ�k���G�� '������TX�����rf�#6Bޏf�#�>�o+�G��#�r.%�����B�U3�%"窙���G3g����fN��TJ�\~�8b�6dG��F3�Kn��_#�`N��Ի�$e��a�8"1r�3s<��
7�9"�h�8b���̩�Z!�oȞH誙�Ex�f�#��ps�����:��&�I��O�[������N�����j_      �   
   x���          �   
   x���          �   
   x���          �   N  x�՝Mo�F����9�B+je	=����"��W�����>Kj�_�B������g�C[�E��ݝ�wgwַ?}��sv���o�s�.�n[��������y��d��_���$��*��d��C�}(�Z���x*�÷I��\����qw(�w�C��Ǣ����>��_���){�&���,�'���X���O��z(���Xg�cu(럹�t:�����7��?_�����m�;n�Z��|�Y�<��P��_�,�_��7���s�/�z���?���R�8����R�R����e�׀>|���D�|���0Oa��x-���h�Rl����-�^o<����<|`^� �
I�_f���Y��%�e�|���,8h�f�%���z7���[�{�F��w>����
�����,6>��$Gx7	���9�r�[h��@r�{�sd	l�hL:qcf�,|�E��D܌����{�e���P�w2�M?*5$`�X��cMR�W��v���*M7��|����W����)����d=�ox�I��2ɢ�`����V��*�@K7��B+9\�t����띔��s�ր�x����	�+<�#�g+�³�^243P�ɫ��tbb��,a�5��
�SmJH@���\SM�|���e�����R����y�{KϒŝU��O����q�y�E>1&	e�Ek(m��7�H�0���4�MVv#}C�n���ϚMa���I��Y�!���.��n�*�/e�Y-o��"a�`���6����-���`:�xϒ�I�������.�ԟ���b���:�"h��z�|��]��$�$�ה�K׷V0Y"@����E-��*쎛@��"U~�P�W�0��WhUi�V1}�l�>/I��|r�T/�P<r�%MW[`��K"��$��P��K������\�Q�lC�>��~��D��Ca�ˎSXI5$��Xa"��TW�Ȩ���/�SzN���neԽw`����tՒ75��'!�pl6�[���a�TɅ�v��bz"���j�C�֪z��T��TQ��~�MƳ�ْO�OJ���G���3��1���TK�?�C�/��A�Sp�ؘ�Nr���}d�V�I<�;6dXk��`3����(��m{���ө���t���-U3�n�Ͻ��Y�|oa�����0��VL7�b�M�Z�DJ��@/�U�J�$m*ح�ؔ�u:[�j�ڝ��妡�t��f/e\ƆҦ��}���5s� ��'�@L�1�ZP1=ԤSTA.`���on�l�HzY͢CZY������D��j���ꅛ����6���Bz�~'q���"��m�zA$���t���" ]�T)H��1�����ӛ��:��|���1$i_G��a�hq�K��-��oG$=�hJ��LWdG�Տ����ׅ��iH�O7�Od�T$}���U�f���g����l�f_痰�4�Ý3�����Y�N���pXz��+�#���#M���}X3ҸG� �?@K:�1�����=�R�J52����#i��â�K��<SP���p�y,�%���V+��{����I��$=�x�b��n����g���<����Ӽ��~�e=On��_]�_�d%      �   
   x���          �   
   x���         