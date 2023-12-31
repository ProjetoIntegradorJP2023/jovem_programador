PGDMP                         {            projeto_mercado    15.2    15.2 %               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    32875    projeto_mercado    DATABASE     �   CREATE DATABASE projeto_mercado WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE projeto_mercado;
                postgres    false            �            1259    32876    cidades    TABLE     �   CREATE TABLE public.cidades (
    id_cidade integer NOT NULL,
    nome_cidade character varying,
    sg_estado character varying(2)
);
    DROP TABLE public.cidades;
       public         heap    postgres    false            �            1259    32881    cidades_id_cidade_seq    SEQUENCE     �   CREATE SEQUENCE public.cidades_id_cidade_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.cidades_id_cidade_seq;
       public          postgres    false    214                       0    0    cidades_id_cidade_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.cidades_id_cidade_seq OWNED BY public.cidades.id_cidade;
          public          postgres    false    215            �            1259    32882    produtos    TABLE     .  CREATE TABLE public.produtos (
    id_produto integer NOT NULL,
    id_usuariom integer,
    descricao_produto text,
    preco_produto numeric,
    observacao_produto text,
    dt_cadastro timestamp without time zone DEFAULT now(),
    marca_produto text,
    peso_produto numeric,
    imagem bytea
);
    DROP TABLE public.produtos;
       public         heap    postgres    false            �            1259    32888    produtos_id_produto_seq    SEQUENCE     �   CREATE SEQUENCE public.produtos_id_produto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.produtos_id_produto_seq;
       public          postgres    false    216                       0    0    produtos_id_produto_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.produtos_id_produto_seq OWNED BY public.produtos.id_produto;
          public          postgres    false    217            �            1259    32889    usuarios    TABLE     �  CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    id_cidade integer,
    cep text,
    nome character varying(100),
    dt_nascimento date,
    endereco_usuario text,
    bairro_usuario text,
    email text,
    senha character varying(50),
    cpf_cnpj numeric(14,0),
    tipo_usuario character varying(1),
    status character varying(1),
    dt_cadastro timestamp without time zone DEFAULT now()
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false            �            1259    32895    usuarios_id_usuario_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.usuarios_id_usuario_seq;
       public          postgres    false    218                       0    0    usuarios_id_usuario_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.usuarios_id_usuario_seq OWNED BY public.usuarios.id_usuario;
          public          postgres    false    219            o           2604    32896    cidades id_cidade    DEFAULT     v   ALTER TABLE ONLY public.cidades ALTER COLUMN id_cidade SET DEFAULT nextval('public.cidades_id_cidade_seq'::regclass);
 @   ALTER TABLE public.cidades ALTER COLUMN id_cidade DROP DEFAULT;
       public          postgres    false    215    214            p           2604    32897    produtos id_produto    DEFAULT     z   ALTER TABLE ONLY public.produtos ALTER COLUMN id_produto SET DEFAULT nextval('public.produtos_id_produto_seq'::regclass);
 B   ALTER TABLE public.produtos ALTER COLUMN id_produto DROP DEFAULT;
       public          postgres    false    217    216            r           2604    32898    usuarios id_usuario    DEFAULT     z   ALTER TABLE ONLY public.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass);
 B   ALTER TABLE public.usuarios ALTER COLUMN id_usuario DROP DEFAULT;
       public          postgres    false    219    218                      0    32876    cidades 
   TABLE DATA           D   COPY public.cidades (id_cidade, nome_cidade, sg_estado) FROM stdin;
    public          postgres    false    214   6*                 0    32882    produtos 
   TABLE DATA           �   COPY public.produtos (id_produto, id_usuariom, descricao_produto, preco_produto, observacao_produto, dt_cadastro, marca_produto, peso_produto, imagem) FROM stdin;
    public          postgres    false    216   ��                 0    32889    usuarios 
   TABLE DATA           �   COPY public.usuarios (id_usuario, id_cidade, cep, nome, dt_nascimento, endereco_usuario, bairro_usuario, email, senha, cpf_cnpj, tipo_usuario, status, dt_cadastro) FROM stdin;
    public          postgres    false    218   L�                  0    0    cidades_id_cidade_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.cidades_id_cidade_seq', 1, false);
          public          postgres    false    215                        0    0    produtos_id_produto_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.produtos_id_produto_seq', 5, true);
          public          postgres    false    217            !           0    0    usuarios_id_usuario_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 15, true);
          public          postgres    false    219            u           2606    32900    cidades id_cidade_pk 
   CONSTRAINT     Y   ALTER TABLE ONLY public.cidades
    ADD CONSTRAINT id_cidade_pk PRIMARY KEY (id_cidade);
 >   ALTER TABLE ONLY public.cidades DROP CONSTRAINT id_cidade_pk;
       public            postgres    false    214            x           2606    32902    produtos id_produto_pk 
   CONSTRAINT     \   ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT id_produto_pk PRIMARY KEY (id_produto);
 @   ALTER TABLE ONLY public.produtos DROP CONSTRAINT id_produto_pk;
       public            postgres    false    216            ~           2606    32904    usuarios id_usuario_pk 
   CONSTRAINT     \   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT id_usuario_pk PRIMARY KEY (id_usuario);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT id_usuario_pk;
       public            postgres    false    218            v           1259    32918    descricao_produto    INDEX     S   CREATE INDEX descricao_produto ON public.produtos USING btree (descricao_produto);
 %   DROP INDEX public.descricao_produto;
       public            postgres    false    216            "           0    0    INDEX descricao_produto    COMMENT     |   COMMENT ON INDEX public.descricao_produto IS 'Campo principal de busca utilizado pelos usuários para busca de produtos.
';
          public          postgres    false    3190            {           1259    32925    fki_tese    INDEX     B   CREATE INDEX fki_tese ON public.usuarios USING btree (id_cidade);
    DROP INDEX public.fki_tese;
       public            postgres    false    218            |           1259    32916 	   id_cidade    INDEX     C   CREATE INDEX id_cidade ON public.usuarios USING btree (id_cidade);
    DROP INDEX public.id_cidade;
       public            postgres    false    218            #           0    0    INDEX id_cidade    COMMENT     p   COMMENT ON INDEX public.id_cidade IS 'Por conta deste campo ser um fk na minha tabela ele se torna um índice';
          public          postgres    false    3196            y           1259    32917    id_usuariom    INDEX     G   CREATE INDEX id_usuariom ON public.produtos USING btree (id_usuariom);
    DROP INDEX public.id_usuariom;
       public            postgres    false    216            $           0    0    INDEX id_usuariom    COMMENT     �   COMMENT ON INDEX public.id_usuariom IS 'Por conta deste campo ser um fk na minha tabela ele se torna um índice de busca dos usuários.';
          public          postgres    false    3193            z           1259    32919    marca_produto    INDEX     K   CREATE INDEX marca_produto ON public.produtos USING btree (marca_produto);
 !   DROP INDEX public.marca_produto;
       public            postgres    false    216            %           0    0    INDEX marca_produto    COMMENT     �   COMMENT ON INDEX public.marca_produto IS 'Campo secundário de busca para o cliente diferenciar o item de deseja fazer a visualização.
';
          public          postgres    false    3194            �           2606    32905    usuarios id_cidade_fk    FK CONSTRAINT        ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT id_cidade_fk FOREIGN KEY (id_cidade) REFERENCES public.cidades(id_cidade);
 ?   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT id_cidade_fk;
       public          postgres    false    214    3189    218                       2606    32910    produtos id_usuario_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT id_usuario_fk FOREIGN KEY (id_usuariom) REFERENCES public.usuarios(id_usuario);
 @   ALTER TABLE ONLY public.produtos DROP CONSTRAINT id_usuario_fk;
       public          postgres    false    3198    216    218            �           2606    32920    usuarios tese    FK CONSTRAINT     w   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT tese FOREIGN KEY (id_cidade) REFERENCES public.cidades(id_cidade);
 7   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT tese;
       public          postgres    false    3189    218    214                  x�t��r#ɱ%��<_@fD�c��k��KU캲�|� �YY@B	$�����[��{��Z�Zf��;����>?��="A^�L�:LdFFz�{�_dWWW���z=v����o�����[ .����?^��c�5|qU\(��k�ț�ӷv���/�C��]���*�x9N]?������������?��~8���*�x���w$k.�����Cyu�A�N���}��\���m/W�\P.D0v�����k;���4�EyS^|�>����F7����x]�\���4\b��o�y@��ݞ����jq�InL�m��kY}�i،���/�����Eyy�ݟ��Oñ�T}���������n�^~h7�(��[�*���۩v��1Yu���m�vj׏�X_5m������.������ʥ���!��ʽ#����(�xl�B~���n�8���xюc�y�cɬ�O����R�|�!�^/?`Z�&��*��e��U���Ⅼ�_w�,�4�����?u]�]��re����~!,��ߦ~�W�)��]��У��<���ۄ��XY�;t�0�׊+���]�Ky ���on��)^�{�DCjy
�p���S�Ϧ��q������_�q�q���������W,����-��mɴ����0l7���n|����s����r��0�
9t��r�c���ʧ(+�I^u����0�w�Ky�W���O}���ϐ�e~����{�޶wC�`%���{>e�������Uw��k3A#o�Ͷ����,�5�`�W4����Pp}q�jO�,��n7_����"0 �G�������a��q�<֍�wy!��N>��������v+y)7.���7�ɼ�{~���O���/-�Y��?��.��:Y���`5Y#o��Њp'ӿ��W����M�P��*���t9P���piY��]����:�ږ��j���C��z�g���>��D�E}��X�̊ҽ�ҍ�n��q(4����l.�+`�}���+�گ�!�8t���հ�(�ݝ��P���FYD��;�x�ry��d��T渟^U+�-��������A������i��w%nK�_Ne%� ��/�r)���L��F���~�3�=^����沑�71`�j}&*��e@���i�Y-�~�Ƹ5)���|l��٢��r�y�v�O����Ȫ�*�>Buc�<����\�e�2	CԵUQ4�na�����qx��T�<��v-/�R������~��w�y��Vw5=�s2x)��c����^"�,���D����M%{@�������۱߯�����q���_��{����2��S'�/F��w�����#�?v�䚕<�_�n%�r'mp,��-Myß�S�Q�Ky�jH��z���l6�/*��)�9��ng��,��T�A�H���I3�kn�/��_솛\����-(��~��+�q��[����7�<��EK���������.Dn�~5��l�y�w�kiy��-���/�Yʫ�,��/�fYVnT}��K��\v�B+�������r!Sq+YV�>�b��v��?�_�m�藙�έ(����e.��Ӿ�W%��_n�c,E�_|�eIy�&��ήw���#���VF����Ḃ�D�1��t�;�� A"��ͩ��:$��{<�7]��h��+@6��
j����^��}{��a�B���`{��x���en�iȀ��+����)�Ţ� (/���|����j��q�k�b����XU�����!&ƅ���S�A��
oA<
LB��
�����Ծ��V �[�>��7�F�Z�ɷ�2��ө}�?�[������-�U]�iqw��v�^��(�tra.6s7N��D���ʂ����O�.���!�/:D��Fƕ�j�ü��@kG�%W�^�eg����V�&h��
.@�� h�/����_����\�v��i�Qc)��u?N��������_����+K�v��Ce���Zq|�=Ӏ�����^�	#���?mD�`	O>=4��K[b���ޜ���Qh�8�JZ�����oӲ'�cD`ҿ���uF����/���F�x����-s�bg���R8ٜ�FD�����9,:� h�h��_�i���݉����A��R�قο��4��{���}�0l�v�K;��^��i��bY��ޑ\v|Q����{���ia�Ւ�0|0����6��u�9�+�C���/P=bn�b=��7���mWc���<7����F>�i$fDb�!⮞my���DIE�D��s����T�)�+�O\p�;�qQ�K��~��]dy}q;��t�Y+?a�m��?�4N���L�)|X+X��+Y���/�	aq�U,����~���^o&�g�5���Q�b-_�ܴ�b�o�!��b5_o�b4b��}-{�&��KZ�1Ԏ�aE_�����q�"s��|5Lc��?�R�M�Ο�%���o��W*ؠ?�X���;��֠����?�b���Ϲ���)�V��dX�.{;`�q�1V��a��5D�lp��w��#�r���N6����i2KPo �5\�1B�S:! ,/@�u��z;Q'bjv>!����͉xō���~��%6��C��/�j�v��ؖ(Y��.Z2����_�����GчN~�n&���O��_qs!����L,&�I����9�(�����d3�Ъ�;F�F��6�ކҨ��AuE �8����a���ӡߙ���aw��;NGu!��KY�3!�� -4ڷ��o�PyE��`�o��K��p��Z�a ��c��������y�:�0^��|8о�a����zx1�U�񻀝��^�15�j���6T#�m��
�/E-���܂�<��t��}�P��b(s=m]��-I5�D���p�'(�+�\4,g���v������5'�%�~��;Ͽ���=�d���4�vЫ�i�m��X�,���V��{і�K����]T\�Bî���_y���^������8
�GU�my_gU�����*޵�q܌�\;8A��$���(��O�1gjo�8�����Y[���9O_v2��1>w���"�\�����\�@D�n���Ll{�z�il.q�3N�q���9'G'�#�'�t��%ߩ+��,�;��
�$��S_�x�������m��[w���dO��x����6�Q��K���a�� &(�"����$�C�a59��D�G�u�o�MA�c6B��6�d~6��aH�p|���	�� ��/���U���:و�_�u5b�ȩ���:n��!�>߈X\@2>�8��*}7ж�_X�|ً��ѵ,x����GZ"��R���bX"��r��xY�Q6�3�>�.2<#�%������Plw��x�=vW��˧��Ǥ=���~�8t�+�v^���߶�`8�"p���>eC3�����oG��ft�/��<���Zn���	t�kY�|�5�=����-01#�_[�P�"P����V��/'�LE���;�U�_�ś�_N�.S@�_��,���@��\]�L��72m�m���~ӏ;�[��G/?�@�������PڭyN���X@W�����oEM��\��x���/	qn�@}��2�cԷ��<�����5����*Y,��/��w��Ի@�v���@������PYit��h㛸��T��f%K�8���\d������A�{Yd����8�W�C��QP���So1���o�AX �羳�ж�OfA-�M+�c,��!��-�.O�,�m�)�ȡeo�_mvr�ԛ�6�������>��K3�r���d�C��l�>�:���Ц8�ۭ&SP����Э���w�Ԑ�К���]P�71m�P�7���>�T��稀�(�C��`���!o�..���X��s�U@_����F�V��O-��St��������t���WR�t��o���(��x;G���H�Vy�~�G.��o���ڄ���d/#���b�lA��W�;l4T�[ŧ�kz�u�� 2��n	/��>"�k���rU��'_��hU������J    ���|��3��By�U�z���}#�*~�M�7� K�#1��A��h%,��Z6��,�E��7bQ��I���:�e^�>���t�`���py�fբ.�\+7
5��wX������U�ptbQ�_|��p�#C�sq���r{K��w��[�ܩ������g&�A��D�4��P;G�2~��!֖�M����5ǩlJF^����MY���l�+��֟��y<�s�w�N�����	ʇ�g���!Y4�y��w���-!+Œ���R���L�ǌ��E�k��*��	vH��޷�&��ޭ�����M>���ޒ�~��c���t^,a���EIv{='�A�8�r�c�������KI6��VT�?��XV�|*��K�Wc���-,5\=��K�X�F-�\fHkب�����9�@f�����X^05��E�!.&@b��aH�PrR������?!�7��d4���7/W�#�H�kT!B#��V����d�܌u?�i_~���%�4����E�jMð�.~F.-�\�M�P�b1�����;l��u_�I��i(v�0�����/�9���~£��f�0⎛-��GS#v�&�1eOS�sLy5pg{t�DAB���e��O�i�͏?`2(i������Q�iA��K;�u	�o��$�?������FlT����N3h�S(ŵ��ڇhd���V������A�S�_�7��=�A�L4��+�gN��e���>�Yse�)	�^����FM2��T$K��"x셢vjnxN��,�Ct���R���O�����B�i�1ҟ��Jx�b2B�ڊ̱���c������{2s���7!��c�Y��Ē�Z�gDQF�+�kf���,o�)�!x��`���h��B�����హ��T�.�f�	(��J
�	���.����[�Ǿ=�)�|�X�ȩ��U� [�����F	<��
Z"�G�ӍONQ��z���AT3[Hf×]�0Sh��� >��ޞ��-��ԱӁdQz�8+3f�|�̖�Dv����.s���ݹߚ��[?�#���>K���=��p\���W��_L	5���%�#�F�/_�e��݊��������0pk�2u���.��e�e����V.����,�(�Ob� z$�y4�2��\|�vm\h�O���%�^&�jP�8��*g��I��iY_X�R�D3D�]�|w�����~Cp���a�2+I��E�0��fj���<7��ZV�����"w>��O��� �{D�N��kxӟ�M��f5��O����WQ��9�D��G�w����^���JfH�d���/��m٬�,�9a��%ש-��!���J6խ��.v"G*Gȷ���y���_�\�3�2�^x���\�)�f?�j��S��~Ϸ�4<ĳT�UK,�N�e��t�4����<1k��Lo�%����t�NO�lw��xz��}ԯ�Ғ�^����q�!k�հ�/�?t��T��j�*p�`�Qw�rVG=F�iB^�-��j��Y>���*���C��gc��,}��.e���x��/K[��@Y�0M�GJ�`�'J 'խ�e��p�gYs����|��"���s��,���?�0S��)	c�Dv�܂��%[}�\?u�p�/��϶�����L_��u��<M~���L�S���`�-Y�8}[ss��A?�\����蜩u��v��7}r�3�ZyQRU�D6�}"�����k͙�'��xh]���%�>,OBxx{���w�	�_����-�3n��Bs:�h�A�m"�u�=9G�0�.�S�Z����>���9b��EZ��E����#؋D�s?���!��P�&�|s�4._`+��]��}'��q+�3�f?�n_����Ҽ�N ���c�Ks#.ϰ{�ԯ�TD4�O��+ޞ:Æ��ޯ�]�$��#��@�z�>
;�O�=�#9��K�լ'��)f�^.3�\�<�trr�$�o���\ۉ˰׋��2Y�_Zm�V�u3sP]�ο��CL+m�'ea�R�c����nߍ����72����b���n��[���N�.d�9v��"��zȁ��N18��B�<�} �iB��/�z=ҿī��',���^oײ.���'��� ^0���7�AH;��
X�t�S<��Xׇ���j?����k&{<�ש�E�Axe��>>���	�F ����h���$���%3�X��?��p�H�h� aǿߧb�0��������ٷ���w�Xj�ϊ%q��W��0�*jB���#��-�f)��˰���V����Zw�v f�`;nﺝ��IUݦ�5)ú��!�C���p���w��7�y�NF(-EsM��麱[�5�c��|��!POe�<$4<�a��k�[`�PS<�k�J�)'�C����ư�u�3����;�|��0�k{�w�9����h�l�a��GZ0IC�d�`�����(�\�6�ɗw!��E�j�2.^u�I>����{�^���W�k6��/^�]��B��דXL+_���70���]`S|3�� �b.�
(&v�A/�+����a��pl�o;ќ��wR��vd�f@�[�e5�!�)����[�[�-l�>�KM׃�J��xໆ69WS%bG�B�%�����D���<���)+���0�v>2�[�:���Px
iy��ݲ9񦛵���d!�|��T<�th����%%�Hq�>Q͓�v�`T 5ޯɤw��I���.����U=7��]ez�xZ�y��q�\�-�7_�U�~�� ơ�e8�ӳc��rL��C�SԵU�ON�/�jX��3�U�1�%k<���R� "�����ƍ�a��̷�:���c<F䊴�F���Ψ�Wd��ՉG)yXt?Z\�S�G�(��rU�p�vW��ROֈ����la/���im����z� ߽:�6��s�R��2�g-���Ԡ�����y�a��qZ�����l�TA����=Fح������^ܐ���YNsh�8#�$}��ox�0���v���ݭl�Rx�`Pf!o-�0' :�٣_� w�(�y�6�B���q9-q2��K����8Vs�f|z��Eˆ����/g�dlz=}�=������#�ꊱn02�fJ�<�s�dUi�\% KA�<��@~+Ⱦ�f�g�3�.k��ȑe�b5���p�(�����De�N�r� �=~���~�<�[�Rs�RK���E�T�Xq�@���S���[����.YU 4{��TA�ɰ�[�����>��aУ�0�+SRH�*n:9U��iM@�9?�-L���Л��Dn�&�!��Ų�&H�yZ����k��"-i�96H���ê�h���]Qe��ҩ�'�+��Z���`啯���~d[�����:��"���aw�\�
� ��o*cM�$��d1� �a�D�{���j�>�ˑ����蘱����?���sA&���������.�����H(NԽ�\�"[^���2�4���Ur������c ���@�V���j�-�|�Cz[KY���NP����� ���|KO�EX�Z���3������<��<7�|�}�eڈ5����ľ�2�Wú��ob��!�]'KC�����<��!�Iʥ��,@C8+�ֲ_��Xɪ��,1���E��A���'=���ߋZ���`y����IL��8;f4/�dZ��ʠ.��� Ѫ/���A�kv�l�\�:u�t��!��"b�����[�/�[�RX���iF�V�y�Yس|��U�[���k3�hG�}����jًe�+d��sd�K��z0�<��ޠ��>s���^6�n/n���N�Ia�-Z�^˳���J� ���:��6��5ݓ���E���Fv:��kͳe.l,�.}��-�t���f�����0�ڲc��^�����1�4�
)`?t(�2�ʭ��]\�N}�t�2�L��ۖk�L�a�>$�*� _�,6&dM��� 3!�GՋqm3U�3�    jU�IY�d�85���O���0��i4�B��׵��I?Bi	���L�7�B���j�A 3��?�ዤ�֣��/�w�"����w{٢���2�o�Z@aX������l�HHN#S��ʳ�E�['f���>����Y����\����ؗ��h��ϷH퀳�0biGp�R��c�O�*K�Q9�r>'˶U,Ƃ٬�n$��]�C"J�e��Z:2,a��wj��!6���X"��E0y�����E])�E��׸>Hɣ�.�Yy�P���uW�ko�ݼz��o��eH{h�r�Q7�=s�x��i����c�Q�8��38%��T���3�KlDȋ��X�`�0�d�r7�1� �,���eʡ3��8��{u;}��\0\�� �jw�(��AOИ�؞�w�74U��%�^g@�k�nL��ʚ�}���>���*���<'S��N���&������_��b[G@j�������6K��9�Ōu٬�<���z����������踟�(Z���(E�_�f�y6��xR�P�>�C1����M�����rnW=ð������5jx�QVJ��N�ee:�*h.$3J;\�]��6A�4��ZVY���6-����ӚXCi��� A�d�ؑ�	�7��]9��q)m;=h�B@K��[�%�j�?/Y�)�����J(��fUj9�|���W�&�r���c^;��'uT�SUQ(-e^�Q��27�K�r[�W�ϲ�s�إ<��;� ʅ�|���3�����{3`,(��Ⱥ�*�dA!vY�M�=�y�a5�Q�ݘ��].�<7��qM�5�V��I�Г)*�E�!}J-� a��lKcw�ς����8�V �;�&�)e�n�+�_��1U�+��&ћ *�|�{�t�J�q�!��/�㸉~t@p���=�$��D0��`��W����X���U?��W���0����H�|_d�#u�X�#ǧ�qH�zC"ڀ���)%�[�7m��8�{�>��b8�Z��p@�ՊO��\(X4GpVxn�<��v�m��*M��þ=�6�r���k6<���_�>ϲ�;W��,�L���Y鏣ȕ��AV↦���up�PBm�2�y=��vYX����"_"�~�e��?w�_�_���s��#@��R�������\��}J-l�� l,B�W( �v��zF_�!��nB����!,)˭�
���ΧA��j��q壩�ɍ?X��:j��ş	%|�[)���*��f8�a�����HF���˓�8����KT2q�����#���Ҭ5�۔��-Y)v�� cV�)y�[�̏�$�b����G��:+��F����8�>���i���A������+�Z!Y|`�:�5����j��J��\*Si��3����t�\�"�F����[w�ϖN��T�N@ �o���U}�N�R��Xg�Հ�k�#��/�-�s����Q��o���=SΈԦ'\��j��i�̣B�}�����un� t��`>k�S,�Z���v:Msm�\�h�"`Hj���F��G9g�W[݊�9���ꔐ�cp)�}[�*��Yͺ��2��XM��Іz�7�&�r���k���1�:x��߶�Y8l��!���H���#�,��'�X�Q�q�S�A��`E�%Ǎ_�UFM��Z�Ⱂ���Fwh�6{2B"x�����PF�o{e�x��kc�@0�hw�g��w)�I��'7X-�E+�Q�2���y��X��,g^)
r�\Qt��yQ�_����>58��s;�<M2(�#Ȩњ�U@�S��u�(m���+����8����ה�1�ϣ��E����Y'qf:	�(G�_�����j�D⡠@���4ɮ�(u��!��ޞY����:��x��P9�kx"/C� Rꟊs�)��s�d�gF�V��4��^���(���o����_�Ӳ��,c������I<3���/�xf�"{R�`�)6$o�)�8�L������V���;��z� X�1mR�0������m�U&�0o���sݐ�0=��}3?��F��|�afd>����a����!�b��x{2w�!(#�<����{�V����D�ezV��%�v��W�``��f�U�TbF���P0W��-�_�AB*����}�^`_0���f��Ɍ����<32)ގ��:^~�w�fHF�D�}3��0�����a���N��ew[�+A�T��O4�͠�Ƚ��8E�-#��O�l �D[Z�A����f$b��v|�dX�r��g$c�үI�t&�F� <�o��$A�q8�ҡ�`�|n�~�&N~�pNZ"�����LCٞ�Q���&��{G��<1����yu�p�=?���ǰ�Q�0��A����1Iy����6�Kyv@�����z�lV��Gm�G��i��k,��<���R��������� �f V�0�� 8��a��1O}�"=� &��C�` s&������;�k@Rn��Y��A��Q&��V����6~�:�m��`��4N�t��p�����2���k�����?�$-�	���%�6�Rw�8�6i}F��v��YyC���Ռ��x�������¬)?ݵ��pj�{� f���`�;�$YˣuCp���/@��xV|=&GA�8+�~ռ.��y }�B�� ��w��}�~�k.+C�;Dß�/V
9�b I�Zq�����>����5��hR��Z0��M�������X �\~���e4���;ˆ(��Oǔ���Z�_�9�Č�3��GM�:��}<����m|�s��C�2l�l|�v�|�ǂHJ�kXc.@��1pfq�b�k�7g��7��BR�ĳ^M8�}�m}u�j�����
T�0��S�5l̈́��|�eM.� a�">𦕍&�-Yw�lt�r�L�6��g�\���?w!�=A�C&_^E� �fФ-="��"����oI�����e�BD�����?����*y���1`'�3AbD��Fe�,+V��ۀr�����'�)Q���Ku=2�Ԫ�$aB�Z�6.��¹�/�d���6EK�2�v��Cט�?FI
/2I��]wH\�k���E���Sz{��_;�9�rT���C��j~å��!EY�����v���c	��w�iX��T5R��=�,�ľ��+q��>����l"ˊ���g�D:ʻi�~V��8��W\��d�S���	�������rÑ�ܤ�Ee�E<+Yf��B��	e�j-��8���8����
����]�1�L�xg)r�<*���d}B<F�����*/�q�75��(��./�鴀+HH�ӞB�.�%�ǧD�WC�'F���oiUU�*�禶B�����+��4A$�6�"��i�&��ϭ�Z����k�`�9Q25$?�a;_5B#��Fun�f7(�.��&�O[#(r�F^��?�ꈊ�+�W;E��;��|���T+�㏳��6��M(x�8�o�V�qӑe�Fs~U�(	��yq�f��D6{%?	���G۵؈xR�� ���yd�?j�;��#$�"AO7�3����Cq��F�=�5�i6<0�h-a���g���͍A��)�����8���py�:�hg3��ڌ�^�T�)yN�!�3%ϙ�k6py>#�����	�&�g�<�Q��w2��Ȳ��� ��-Vg�@v�O��˄�1&@���w��{�l��bfo{�]I,��@O{|�o����oc�x�S#��/=���-�'�ѷ�?�[&��d[�mh�J<��:OI���|V���j5����1��ӈ�|��C�OWXE�;��4�0���f/��aheQF?1�sY��b�&w牤�'��٤��C;���t��saO�x�8�:�1��4,�B6����Zg�1�v��I:/��GQ7g#>'3��s1���΄��,���`|@y�,st.p�Hno�6����I�4Ĩh�5�p�ޤɻϏ�Óm�^���ڨ:�����}q.*{���~�CQ�±J�80_�d���d���aXg�c����׶@4��iU��l�e�q/:��h1f����6�    �}�{k7D�,C$����0�� s��� zeZO�4L����3�\Ͳ���-[W�A����f�-z
�Y�`�6��e~���˃�ąuqq{������AU$14���4���s;���c�MR	k�v:�Wp�*��RQ��iX1!�;u���_$� e�+JKW��8��zi��}�.��t�2"TX_������Pb�FF4L�[b����o(���n���yh��)9G1��Oy��$����m� 8k�,�2+� �c��;��ƪK��V����i
(?����/M�yʜr�#� [O� �C�G[?t�;X�&�c�L�Ī� j�NE�y`��Y���Բ�	���� +�^>���⯰8H�\���S�X-���I�q@݄��pSY+*8�@S�-��j^������EK�[2N�%�k�^|d�q¬BҨ�~i<#�@�S����֭q��E`J�mm0�{�(gln�ݒC����)�U�<D��~���y^���	.�������Q� ᅤ'^�#�����_��^6�=O�
��@p�D�f�	t����7l,�@�����gco��?�_��H�-G��`�ɉ�m3�"�4�Q��k�b�-Ȇ�}"��}�d������J�ϮS��ы�疵G7'RR���v�
XC	́В�t�K�>Y����c pf�n���wb��#���I!�R���|��C��8��2�gx?6����8zir�eٰ&n}���G[����SVY�؅������g5jU
;b���|����]�n����0�O�`ӧP���)4�j��bƉ|��ٝXӽ�E��5���[э�"��Bi`�-�Y����X��K_��bHOCZ����1B��<����o����.���!U�O��Q����U�md�:?ci>��*��3����;l�GM�p�=���Sg�e��bb�]1�G�g߹�EY �P� ��y�4>-��}��F�!ۡ�a�
�����U��k���<Nv���lUu݄�H<�Mk�� �����1!�*����.	`�~��Ѷ��whM�W�s��]��O��A8<桀�Yݧ�؍����,[7W	/ٻ��~\/�M�l���κ�BR����4��il�N<�G��NB,��N��t{�5)�˅EKPO����|�N6\�QkW�YJ�8h��Z�FW�sR[��ʓ�����d�L�c�f�g�ؾ�e.�����9}��ꭳ�y}�Gzg*u�X���0ه�QĞ͐��F/^��.�7���Yb��~��.��$�kt5�1jU�.+&R���5sp �8�q��ł�v�������b�q�0�r�o����!�%����΂���8L>a�jnE��>�Y5�x�uM&�_'���x]����0Q%H���%�:�/�PD�W���ߎG��x�U����?�A����ܥ�wXV��ur0�8L����ޠZ�i�'�
�6�RM��M�D�Ee��\�z5,{ml���f5� �B�v��g��f�2�+�Y���-�@��R\;�����ʪ���q
(�@�֓�$��$GY�Ae��F�-Q�75 y�69��L�2xj��a��j�I�j+(􅡸�7��� m]z|�S`F�U�qiR�%� �)7��e�=
�U� ˴E!����(SXh������*P ���a��h��F|qBnF$)�pH���mU9�>�y����K�򤯷�a��%�9Hh�q��81?���$�Ġ5��'�Y=DƠ�6ڽ���
v��_���/إk?�mV4��J�Z�s�1�ӣ(�s���g�ݰ�g��K��C����/ HK{����o����
k�C6�|#`2����^ѷ�$ŕ��}��D�Y8u��Ց�g?����+C`Q�j��vi�GR�_e�3��~3[&<���o������,P�s���U4eW~�<���&`E��N��k�
-Oٕ�˪�ޭ��4����^h���}ԓ�f� �
ğ���<�B@���.�5�U$����a�e��t�G��4��f�P-�t���U�F�p���#tisV��������d�Oϱ��1"�W�:C�*�6OQ�7Wd�����F��)3'�q�,�����-�c8&�-�졾��~b����he�t�N�D��@ؚ{�b��_0� �ذK��K	�Y���[������pe7��4�� n�5ʸ������#CV?)�W�4Ƌy3DC�8���9�E%��V.� ���>�6�G�w��^��L�b2emq`:�U�݊'�F_� .��|H���ɯ��n�)o���~�2��w��ࣀ�&�����Δ)o��s}翠|$�O��c�\��q*x��]R4�e�G�A�-'	v�{	8���9L�3�m�I�a��4WN�Bl�s~�4HB��X���k%� 9I���,5U:lT���}���@5r�s�'Fe�X 9L�⸹_+!��4�v���(����[M�4�������v;��ٻ^#M� ��f�wTIMX�r�O����%T�m������6=�MG�� A�DK����I�n���r�Wd����j��/5]mb�4�\1� U�I�vȁx�/�r�n�t�
�q�j�WZ�9l��b˥��<$�mNӒ.���v��`�1A�{��$�҆ĸZ�͛� *g�E'��PU�D������i��W5�O�"*dJ��UE�Qv��~�U#���W�y�+fA{�������$���_�4	p���;�jn8̀9���Z��cB�8���{���J�>qsuv���]Q�t�v>u�a��m�g�-�&龶m	�S���o�?Gݲ'"R��;v�����I�?�5w kV<�r��ll���'�\�c<�^>�":�B+�[���R["��B<���%�[��TCqd.D/ 9���yJi ���*Ҿ���4!wTU���+?�P�<�Oh��P�8����,넠��n��r"��~���vb���GRUA�u��r�����d���E�*2������$$��z�
W��D3��
'S�6������lE��x�,���"�"�����;z0}ϔ���-0�Z~�T���t�!�~���L��*^]�!�[Qf�
Z7r~��(���i(<i�0�L�K�,js��I��ܵ�$�r'� K�t�.�^��I�+�g���dH{�i�o�Y�ўۧ��������g,1�����ȂD��[���G�c��]_��MKd���*��$Csm���,�ԧM�;/5��ruP�����+`ڭ�'xv����&`)!O �_	Y�o�s��o�J��+Ei��Z@�"�l��;+B#��g��&�MM"AW��T�����;�����<*g�_��3����{���VK�ڒ��
Ueǹ�QE~Nl4a��t����>,�m�?��b^�pq5�/��=N�/���` ��;�cK�(��w���n�E=��MQŊ��ܖ�kS��ঐ������]G�R0���V��ZBIHup&�sM�,@e$G��k�B$C��l�_��]����RD��XȤ�6�A���\Lɐ��*>
��v���Er�Y}!�DY�q���Z��3f���4������Pk�7��,:Dc��!�z�#�sV���F6�μ�E]>�f,�K�l3��>�h<ș�4�'�:�9ryY�b�m� H�c��1C �lSs2~�t���
t�f[
͕�A�h�R ϗ^�yK��,����?v<�E��v�7y����&�sq�P���O�J���7���C4\\c�L�n�RO6�1q�ARx� 3�!ٳ0@�~�g�\i XS��ɲP�?X�ALrM�� -y�*E������l2�+�e�wO�_����>@ι
_�+H��7�R	,���P���OX���W����f�F�p�
��c�łԆ0�2�t*b�#���iKـR�jD��2�DT��}85�8��ٻ�Ht��v��o/cO�0��[(῁���Ì�� �WȌ�?��3R�k֜A��    |���ź��W�V��x4��rJ�YƼP��1%4�C	(T<�_�Qy�_�Qr���BP�q��x�yC����~����E��}?�;�~)�ݓ2�P��ܓ&��}#��r���P�:�y�5#�}�E�xY?z߇ (�\-댜��Ϯ#F_ǵ߸���.�dj�D��V��{�p��ɜ��K)�!�.C?���x-��וO sN_o�E���Eh��USQU
M�n��gPƴR�����Y���gD>��o��4�g�6'�����z��{���C}���uZ4v�z��A�2ɣc�Օ�f���@�?_'d�=ާʅI���;��Ɵg򧆵�O��phz�9�+d*=�X��^j]�4zp6c��k�S�ژ�i��� O5k��t����H=&�13��twCɘ�������qy��]|cL}��4�U�1�M�g���.�w;_o%�o�����
ã�ܥ;-�֗D�ϕs	�9���2����LƔO��ī��Sd�M�.�j� 6-��	To>AƤN�sP>/�������Od�c�ԋՑ���v����dp��쳿bf��`�.���
���v4�6a?���%E8d��9,%��{3j_������֦����A� ��DE%�M��&�Ywbj�����z+�Qr� �l�N�뿆�����^^�;8nW�����L�s�C�v��[)��t��� �Ad<�i���WQV�x���OMfp�ď��]��)\d�5M���m��2w�?J�ui�z��2i+��TZKw92&a۴�`^#�փ���>%�Ԑ����3fLE�d�Rxy����Ѝ�d��}���d�2���.�,j �>q˛�0ٿ���y��/j����*��e:eZ�H4�\�`��CSA��%B��zw�ѽ��~6�<q+����itW����@T��@��aP�Ē�U�V�L��w����7�㜝�o����7����Sc��Z�ٯC���p�6�b0Jv�le�����w3k�H�V�7r�6�9�3��+=���/�r�/#���M��1�0G@Y�ǚ7(�!�f�9�1~��7��a��#��s/�-���y��W��l@�2�FЖl�]�P�(Z�{�)�]4��,P2�q%d�����g�y���-��6�O{-\{)��ƶː�?���vNҵ�Lh"gf������D�kzi5,�|v`&8���s�{�P2��;��`�l*lGbp�7|����������l�~�|*،�_l�,R����|�.06Z�9M�ɑ��>���e���q[��7�r�K���odL~�b2�j8��K�n�}�Q��q����򃘜]����d�b�|�|�9gb�X���� ��cx�C�bS��Nu�y߇YM������ߛ!����;y�q�JT�F����bgb$�t�jٚXs^��a���D���*�0~�lE�XE�?��E�n����)P����E�����V֢��r6VQ$�PIA�r:}�f���a���Ff�Bs�r���a�b������;^+Й��*&M�A��˘���\i3��K�d+c���x�h��N�}������C��dsc12��^!��J�3;M�CWb�Ղ	�j�#d8�'��fO6e����l�l\CN�"x���o���Un-ɐ��=�Co��a���(ƺ�*�k�eC�6��P�>�F�&Ck�SF��1�lO�4-(����
E?>9lNL��W�N�аng�3!2�D����x#U-�2��5��������|9<���I�����f���k�jW�ݎ���j�c��3�6=�����X�kDD�%/3����*�T���!��ȴ�:%
r��Lh���2����5����[��x���)2R������9��#��;!�Kla�B�v�(���(�lG��m4��M��cP��rZhoq�f:�`+2�>���WD��x�Ctv
�*#�Ur*Q�M.���(�Q9_`i+\/J���+�����N�ff �j��1�\lZ$/��{��Y^��`�v��ʴrһd�2�ڒ ��pM1�Y�}هn���.X2
�\CY�@}Z̿`c�ݸ&1�Bп�#�3�v�{/� C�
�q�`�c䬯:;�.@���<�Q�U�>�"�3��d�)�����m`w��m�"]%��-��,v?'���\�E��j��@�.[�5<ѣ`kcEc�G�j���.�}�xN�k*�����Z��~�T�۬+��/�1��ɧ*�F����ɏh��Q��Q�D�g����(�$l?�D?B=JS'���gM��0�^��
�>�A����~(������LC �$�)P�,џ}�l�&��uK����c��6���E�roD
�C!({�G��%�:m�GL:-��L��߸;Q�WV��1:3ۗ���P�k��:T�>�ҫ���ƍ�ʺrh��ϭ��7���m�L��S�:�т��~ܶQ��;��R
<����m�����5�q��'s��f�Ͳ@v7��)3�z�L��l��޿�~�$h]�iH�	��mC�,$d�4
��㠢�?M0k)
z�x$��
���d��QL�_�$�L��d���hj,����:��%����`�5̕,�f�#;XPj+�����j�	�q��[��V����";a�*�,��%�LQ�m���U��j��<����f�^+)��^1R����_��$٠��*~��0>�	>���Y������e�5t.�2�h2>�Ìd̔!{�aO��9�MR�Q�-���wJ>�}�^ـ�c'+=~,l�� ���ԁ\u11�L4Е�����T�aM���]��O�n���P�n�������TA��"���K֋1��:d�$և�v��D1,K>���ȁZ�#7�]�L6s#�઄�܀�ܢ�=��0	�(�qɮm��:&3�l���o'�7�����y
:���ږȕC!��l��4�&u6Kvs��)����S���+���D��L�(+ >��/����������^�1�G�1h4E�(�.�q�/���6�	b�8�(�1X���7��%[�}��WG��bLċQ!�UMRMJ6�#N��k��q��<��v��8��fW����}�-Zh%��k�:]��Xö�Ap�?�xb��#G�q�ע&���d?��(���l)g��kv���T�l(�,J6�0K!.�8��h���QSF��@,鏖g�.�	��ʩ0�.�Ӫ?ű�w@��(O��y�9�8m܆������HĖ���P�����?y�~#��۾}�=sBK�w�ԭG��.�	���rp�.��f,�*��a+"W.�'�����Z�W�ω=���A�������$T6�W�z5)�w��٠5����nؖl���^���M��%;�ӜC�Ph��ݛ�S��ۧ>M�*ٸ-���K�o�r߳�d�6Jy��n���å�u����dw�����"���be��C�}%U�����>�h�����n7�K�ysr�����x'q�}�/+R�N~�QVʷ��'�e�4���-���Fw=���|�Ew��}���QH��L9q�o�K��IG3gz	C��!3)h������Q#�y^�m�����L|���vgKq^#]�>����6m�������.� oֆm.-�va�����ݴ����n�[�7Vx�M�>��9�D���"����cɶz���{F���D9�~��IW:��?�U�4��{�����ˤ3�9;c*��t6$����\(��)�=G�Y����#v���6�0q�Si$�6E�-�=�JMMX������k
J�$L�$����	r�W���o����_&Z�Tac�D�g�n=�Cጸz�y��sﵴ^�&�MɄ�tR�O�٣��0<����6�{:�^T�4F=Zi��'��s�J��=��mP&s>hv"Zi�'�>�8I���$�o�����1=�<��>��2�?#Ƽ���6��YJ�XE	O�����-��u�O�fa�Z��Ճ�@�=�O��
���T���Z�����$��r�Z&ұ�!��i͆|�b{�=%�~�aPi$�47~��_�y    ����1�n����{��m�����������I�2*��{2�|�d�zvXb�Tl��d�\V��&��pRfųg�֟�j�,�:��}�X�Qe��#�ó�[g��r��8�:�J7A.ΤI�B�\,��?cL�ʜA?�S׻�<��?ӛ��,�9u�h�W����Y�=�'��?&�U���p؇y�|�4% ����^~	��Y�T���}{0i�����g7,�<��rl����$�s'���3���4k�ʋ8�A�lL�����j��KR����:��{�c�ʝm��0����.i�sJZ�z4�ʗO8���|U,��Mʙ&.�l~"�~�\�M�xɕs{�O�K:׽EaO��[��So5l	�[hL�󁁱}������ӱ�	)J�����K_�U�&v6.I���&w>��(�1�|عf,�O��q�R�I�����'T��@��k�E�;�i�ٓc��Zbҝ<�_��Di-��YIɠ���JJ��}�����й��}���	���4��������RZ�&�1U���I�J����A�ԋ�C*IZ��f_���hqg1YƔ��OzTT���H��$3Y�~�&;��ޡe�0UN�-����
>+��٨���9������M1�ޔ�BjAFW�w������.;^���
�7=��ݴ��Ŭ����W�$ٟ�^�s��Yg|�S�$_a���W���I;��צS~+5�q��Ssq�>ҝ��$����CO�4�����<�Ƥ����<l=b>{H��n�մM���۶V�Iz���T	aW͂�4���q}� 6�A�>��A�[�l��S5�����G"�v�=��s���
V�s�2S��:�n�I�dGW�n�1Iqr��2�*.�b��V^^-q\q�ٴ�Y�@B��*^'J�jU�������;�C	����8�#n95�w����t*IC��8f���]R�^-���z���WK6����`j������� �Z��P1�WA��@�	?�V��q0T�O��g��q���Q�}�����E�N>%3�_O	T7��b~�W�i���)g��:

{nx�`4��O�Z�w�k�O�Ey��
6����O��֭W(��n��Ck��v��~@P�zG�<<�c�@q�b\�1�2ר^��F�.Ƀ��ӬJ��I�ٳ5���:e�,rZ/�d��U�,iQ��G�qP��ŗc��:����n���v���DuA��Zi;��~�V<�+�u+Q+>� �:�^ӏH�>�Su`Q��Jꃸ y`��ɫa%[�#-�/`U��0�8�G� aQ	$Ц�| ��{܀eB�&*IԌ�s��4ڮ�<W��=7����	]* �SK��P:��}��jP��g�����
	A���V;16��tk������u5����;��b������N��D�l�e�g`0e�w��� ��4`��&[�nH�̓��`=�������jN�k��d��M;�~�e��$S��]wJ�2��̣L�H�R� '`�!�~xfk�b3�ZH6)�"���-��T�3n<���.�����q�?YoY]��^���������8���?HT�Z}�
>�i��eF�* �L�|����r��_�R��:+s�l>sGoZ�&���g:G�������>�XFy�j�w>%��`��y����Wm�ZcpeL�B3v��W� ����i��WY�&���Һ�>Q�9+�NSh��h	�g|��?	ސz=�7�`�� �d��Lj$�J� �I�$2���^0/�	*^��a����|�\s�q{��0����.�fZ��R�1�V��d*q������kM�X���o�T�ƿQ���9�A�Xƪ/���ab1�!eH����O�G�bmʫ�>��\G�����A�i�8h'v\R*���U�ѝ D���[���i3�/�����{ϚCk�q�Q�gՏ����k*��hk|�-����W�d��eȠ�C���[E�
�Ef]�Kf�]�U�����Q�Ӌ�w0G��������4�x���*�t�ƸA�0a9�,���32^]�׭��h���О��E���S�_T�ȑ��B[hC�E�,���M����b%��ŧi���Jϯ���ʮ��y{ߦ;}�B���г�yz���U<@�y@F���/���&���LW�B��0(A����"uz��d7���9Y֕�3LM���O��Ӭ�6�l����c������}L�x����j���H0h#<n�hז ����p(�����{r�s~#E5;�Q\3���ϴ.������1��vjw�6��B�m�X�ƕ具�X���$\'���l�iC�F����o۳�^�w�]b�
8*>��Z+�pî���FA#��ŭlu�1ű���1Ə^,WD����Ć�P'�ߋ�nX&��6	U^���u�����ir:}��j�z�vMWS�p:�V�DF���������8���&tx	��i�a�G[�20I��"`Nx:[�j��c S����d�h���X��pݑ��=gl�i��w�aK6m�Z��'��[�����(s�W���)�	@j�`7�q�.``=?'�-�����XC3iI�nqHgW*sv%ժ�UJ㭱��R�g����2|Y��Mސ�����ݐ%	���$�A�*�fz{���!`S��Kԭv�.�/��9dMDNl�
f�mZ����G�\�.��O�1�)+^���&��H�@�g�����y}T����T�#;eB���䥔}v�z���3�e\����yNh���|y���Ue������T���E���"����}��kM�[E��<��і;�QV��6ڵ[Y�+��0LəV���;j��EƵ�\�PRUxJ�cxI^�#:��J6�$��~��Ѥ�lO�6�V�_���t���$�gT�~Kpx�,�s��;�T�Xg�Tl�;|ￃ�7`���T�}VR�RW������\�Sr�e&��"Z�C���.'_�\_���U��/�8����~/{�PJ�J{���85%�SF�g�J�>�a%2���QPD�^��	���H#zg��"=���1�7�{Ę�b�1CYm�D�m���{GscZ�u�s�@�aU��!k��s'j5�K-��n�ȸ���I�s��K�Tj��r�+X_y*�(��!�(��Δ4D=p�r�X��Ǿ�1�w8�|�ݠ҉>B��?�X�lF7A�� Ɓ�������/h�bD:D�`��fHcگ��J���B�GG7W����� 3���rR/�	��Yh2����L36y�	�@D��в�x/.|(,(�7P@�`�Ek]�@D��M�a���\^i�}j-q����m�}��������[<c`�x$eN\�\���q,g�x�� K[P�Ԯ�#y�X0\s�!o��Pi�|��ʃ2M�򇯭�8�{D�?Lۉ��BK���g�R
l��B;�Pk�EdV��v2pn��8\�;:d,'��St	Xhu��vh6@�b�m���Ԗd���7 �"%7`ZKx�ӂA-�؂/Zc���h����T�̊�Jrb{8������w�d�D�*�v�ʀ�1�+ �dev X�".����B�$��h�ա�Р�,��O=���-�rpX�-�w�H�q�,�[��S��y	�Y�%�Vf��t5�Հ��Ī�m�H��X8}�eo�$Q���~���R�������e��v������dƿk���i���1�g��/��A�4^�ӝ��c���u@Ѻ��kU5��+?r�!�t��t�X��]	m�/)x٭�"'H2O���5��,�>t�6��$��P MU�F��=#)��6^P�Ns�角*MuAJb1�)�GG�g�kN���&ߴ/��_``�c�s:s�Y&��U3� ��ȟ-���|ٜ�Iq�$���%�E���VXĜ�p���pu�3���,��zJ&��[��ۨ���(;����39�d��� ?��ίɈ2;�gQ�������L^�'�>���|��v5�)�j��.��QW{�2?��E��b�b+t�W Np�    ���T�ӛ��<Đe���ip����f#"��!�Ũ<\�e��m(��Gv�O�,=#m�]��g��� *�B���'�V��\V1EMdmoo�d���5 �v��|6��e�`���l8�Αޥ� ƘpH�rkB,���Z1�;L��*Fx��?~U0uk��r5��%>�`f>rk���8X���Z���0v�ޓT°�m2�i��C�O�ԧ�"�"-.��'�c,�� �9":2�"K6�fb�q|�?@D�`�|����8�m��s�O�`�\o�4���w�f%[���в��=�%B&/���a�{����^l陷��*�{<����8)��{hG�C�Il��a[]λ�L�������5
��.T2���X07eӏ~Gl����e'��ͳϓ����i�Ӗ��gO>��5����,��"4�k`�'��ޡ��A�4r�P�m!��2"��e�3�#]-a`\����@	ҳ�Щk�V���03�}q��`�'�]l�7���E�5����u^�L<�v.�s���Ԛm3��҂�� [�`P�;����[h�:">Y�l��xs˵�ެ}�I��L�)�'6��Jën�1���u��[ʄ���|��Lw�F�ȲбЃ�β>����/�g���G�����z�ͮ���~��	��?{���k	��nϮ�����Ϣp��Ze���9`�*�5{�Yʆ�P聕F?�~p��G���dee�W�j�+���Y[�gމ�}�B�9�?�`<�v�",>Sr�ŕ]f_�g5P���V��aHz5v�����b�A��@m�e9V�i���c���~cMT;�
>�(6�Bqi��ĺrm��(��:���Φ�:r�|B3�������N\x�}(�O_�v^b�����Z�f ۵|�=�Da�jA���S�M�z��[�� a��mw����ְE2�Al�"��<Ĵ��v-
�����[}h�[���yd����5�����>yL1�{��|Q�_0�M;��G�,�f�!_����*�d�$��<���^[�����U�H�ۜ�K�䕈��'y&�ӟCv���d��Ş��h_/���5`8������Gk��D1O'�b&�w��]��J��s	��
MI⍲�+4)�7u�Pyn���?�հ�8<���+iK�d�D��e>�?2����ɞ���uYTl,"%�<}�5Ȁ�W�3Q� њ�uD�����)�jހ8�#y���pRc��*9�~�8�A�ѫ��^� ����� %16�\������'�>c�(�|V�n����t�Pz	��E5�}'�7�Ye4��q��ٟ��8$
-�-�f��7u
���$���B�d��;|r�j6��7��Mo�-��Z�+C۳v�GK�e�ðwK����g�gU~ �j�΃̮�ӄAy�'��,{�>L�/b�4#*��,p��iF��B(�������.�y���n�/k�tHn��v�e��\��ٍӣ(��"R7h���"E�
"F�_����kM}ӄr�l�y��l~�9�lZvsH_҂M�n���B��� agK~�Vf7ck�`벛�;����J�/O��l6��\�L�}u�e�@ ��=�UC�2%�?tߘ�����Q6Nq�٩,0��tł���	a }�h�Y<�{�f�WӂMʔZ���3�8�ClLF�|^ec2��G'�lO���3�{��d"��/����i�[@�/�ӈ��f��ܒvUP�)����]́>}���4���Z����s?�T�һ㽟�h��$|�M�{7�\� ���.f�{��\�>��Β0�b��n�f�11g�(͟~=9��{��!Yx�G�~Ho�|��1��{�#�(d]��dR���x?�Pm���Ćd�CZ_����mw
ی}�ofpu��2����j�>c[Df�.c@��(�%�S�?'��AB2��ר��r��Q�W�D�z����̷��]SkZ|*o©,�)�D�㳞���(�Wa�1bӃAY�C�� ��@{>�2/cC���z�9�dKp��
�@���K��9d&�d�
�Ơq�ݢ�ݢ�\ξW�5���rUw��]�X�9�P5�&��#��TӇȑ#�r�RAjtT������o�MzeO��� X�Y�L�ţ��)Tc�e���68�Q�H--��я� �C��_�~`x�D�{R��� ���?�9C�,��.9T�E��L��./�@Po{ԌE�~!����[}E�������R<�c���X�LZ H��Ѹ��+�I�?al��am�Uڂ��h�0/F:�(���σO��u&b�I�I�e��2X�L#�TY��J����Q��Yi��9�S�p���#��ǯ�ɷ�2�D�[wf��_��$]�g,��܈�c���Re��B�Q�c(�^�}�������ӳQ�3`��;j#��1�$��T��.\m�Vő��οj"��0l�К�1�j}���&�|�NږL�8�u��U�g�*\��p�B�3��m+$�y�����t�������ǩ=VR{������B��K�����(�b���q���;D5 ����dl+lQQH���:a+��Ir�b�9Yв�jǦ��A-V�	q��Uٴ�_�Ve_;���I��G|q�|#Ċ0��2?�;)2O�w�1rohф��^�X∟�^���Ig����X��,%_��/��AR.��*\uaL^����ߐ�#���Q�Y�X�d�2o�a'�=�brc�O��r�zUp$�ca�Rû1�r�����_˲n1��,
�KRv��;g}�?��YUͳ��$ܟQ1�x�3(��<z���i:g���x��b9����ҰpA�,)���"�
U$�\�s��r֔{V/�]���� 5;�E*�=�8Z꥚,L�iK�T���S6P�>G�1w��=�$���PU+$�����V�^��;gấ�C<_aʱ���sְ{?._����ŵL�v�
3 a�����+!� 9�sr��I:Pg���
O�lڂS�i�h�F�y��̥)�Xq�n��vKZ��0w>F�,v��<�Oؚ���y���L�tu��ނ$p�9e��Z?.V�[���]�hs��7��⍶����j��m7{�ҭ��"r�3j%,���D�����*�QI��FK���;-�����k�ťE��}��q�PI�<V�l��_��w�j���Y�OZ�������p��X�O(2a�G?��}D�r���d�v���[�]��d+{z�*� F9�B���O�t�/�#yUD����S5vaN�;h�rӬXUIn�6�Vī��W����9k_�/�BS�����z�r�3�\��*�=�	�ˡ�j���r�.���˕�ܼ�@�/| ���!�6�i%����֗��'�B�ALNT�.������Y�.U�.~F��~
�r��O^�x�y���YS�����s����w�i�5:$���?���ŇҊ���m]�JV54J�"\����Gp���t忂L�-����%��86����7G��8\1�Ox�>_���Y��v��K)�Ro*,g�ciڰ��(Y�]���m�I��6���͝u�g� ��q���������" � k%�
j��Xs�J���}�wA�J4e�n��f��`���e�"��Ky��Ap@�c��Æ6���7�j��b,&g-�O�t�����a��qb��5<��L�Z��k�qzL�[2�R����L��<b	y�Ǩ��]>_i�����c�%�dvOB2]!��0������'�kҼ<}U��\�A�*�����@��Q����m��P^��P�Kn*�@͘8
g]�v�A"��
2�Ѳ6_��L��)5T��2�Q�4{S#"*1sM�6�d}����̋�Ϣ�S"��"*X�a����,�2��T���)ϙ�yX�(/H�>� ����/�6@��똹��YR9�Z`�z:�G�r�����w���<ƫ�O3��PHZ��4^��Y�ʙ��Br!�l'-$q:ٵ�)��^��
U$�@mc���+*���;��]p�E-��Y2/թ7�
��d*b7i��Z��    JrU�w���,7��)���E �)�yK'%����Ϭ/�f�g�D� ��g_���|�1�V��e-�����QAD�I�lIq���]��^d���@5��a���Ԍ`��A�E��!=A�U7j7\{3��_|�c1���T��1[��V�N�X[�?�?�
�j!�DZ��KgɌ��-��ϯ:	X{���c����\Sgi�:�Ɓ[b���M~�����]���
ȓRG�q\��"JW��\*F�+�� �4̷<���[u#	�X���o���&	Z�1h��������
ƫg�v�R� �W�T�ܙ|VM-h�(�H�x�:8VI���'Ϧ��P)��z�e���;�.���dԽ:yVD�ۜ�W�ap�,5�cQ��x�Ϥ�<M�������!g5p����]ͻh����o�-� z����� ��\T�V�����x�-��V��K@��lc�3GCㅴ%���S�J]���RXz(��F�:��w�m�P�D2�Q�##���R����@����&��BF�&#Z�X��%�*YeT��N��7�r�jb��F���t��o�˔��ۭT��V.������C�#M��j�"�h�!�H��c\xe�N�g%�A�2a�o=�T�3�4#��vd���H�Y��y�A���)��Y&u
�6|�`�L*�7��Z��#Y&noJ�*"�k��PR����>#Dm��1(kb���so��В̽��}"Q&�IVߕ	[h�|V�W�\����F�,��|q�rI��3H����G��\��n�oǪ*q�9�,%�:�����ȳ�|�0��_�6�9�^����k�=W/V�L�&�&&�[\�y�i�-�=.�<M��Փ�M(�'�I�dR���G���ߞj��<X�&	sZ)�J�h�u�b��j�̊u��{��8�q/n|v�
�t�b��$+<��r��"4�G&�o=}�c�V}���M��Xe��d�����A�Ҕ_��L��:>4��?`����d�*� H#�Y�p��.#C�#�γc��'�GD�In�l���4��n�s�G\۱�!�����6#O�㈧�"I��Z<��?N����!��J��)6�b��˃�q�Ə#J���0�. ���~�bש�� z���7�5�Y�7��U�Y�$�e`�IŬ��e�������BR@0�!�h�1K�5�����.��b���R�X����R�Dw5S�
�1����	l�����#���q�� ��b�ثy��E;A0ь�:<Z���v�v�]��k���OC�x!6f��/����~"���1h�;F�4��o�FI_�tU��B����$��E5�s��1�MF�T�J�mub�9�?�C��L��ss�����Pg��JJպ?��9*抝19T��,�Ł�&O&K[MG	��诜��SEۋt�����'��jI��q�w���YXG�0�'�X
f�Fa������f�S����}l�*�z�^[Ε,�mۨ����O���t�¿:�i63V"��{���a��T=`o)X5#��#aD�(Z��{��Y��z���jN���t�Лћ�O�_��Y�g]6�7�gjp�*,IT�ݐ�.̞u��Gk���M�z�Ow�?I��]z��.m��|�/���gf�ʡbU�./���j,`���t]	�����o�;�۰��Z;��&�`�{?�ɷf��OR�T 9i���(��g�;�O�&ףs��E��Ŷ��jw?��<ڤ�<�I�Xχx����M}���|6a4J����r1�&h-�ML�{����g�"t��N!1Jd�Ȗ�8G.Z�����y �c>�+N�j���4���q��֫��v+K�tL`�&����,��a���S�<=QlXݾ���+.?Co:�	�Z�'�	b��Vy��8�p3�-����z��68���_XYB0.|��c|b��7ɿ�m�)<�hz���V��f��b+��#�J]D+�넧�^�ԯ���L�`�d���m���$�E�ӂa�������pK}|K�Ԥ�Ͷ&7t�}�K�6I �x�L�|���bD��Kr,\VO�+���@�d?�WƲK��e�O��� 9dL=�lޓ:���6��屰�����x�D:}fR�[a��m��n�o���/%�<�Npl\�Ĺ�j�j�\����*/�t�Ǟl��&9d���M��Ռ>�x�x��$mRW��&˰�+i��mm�n������!�w��Kv��@@v0Ʒ���	���"ڙb��B�C��Ew�,O�]R�ċ�����=��ն�[)�`f�#<"	"�v{�����n���ѕLm��J����}��o�o�����#�D�SL�u�E8��ǯ�[�Պ�X�U͈������_��x�XɁ|~D�xXQxHˍ�+�}�l���q�4��,E���9�s�Ź�m��`Tq
ŪbM����M��h�(�&�������e� sB�ꙗ׶��2�Z�K����/�h͔`��=�]�����}�p��7���ì�o�7v�)ﺯ����*I-ѥ�R�/�>�2��q��$\:r�F+`#�s�(*Hι��H���H��)��i[����~fq
�t�t�w���8��S�u�1z�ڱ�T�M��y�钩���������ҷ�$�wa�}�WC�YQ!�F0�E'n)B#X%dm���L�L퇿>f�z���Tm\�NQb@D4V3xh�l���s|����ʅ�^NC��J?p![�v��O�-����1I���L�]��W�jI@��qأ���"w?p�"��p��x�l�һ�Z/��5XTl��� ���F?+k �����]9���m/��ŀAĹ4{��X�`���,JY�H�Ec����[�lS=P	zݽ�^�yQxzq��ZW7�N�j���Q�uf_�Z�U���'UsU��(K7�c�fM]��$�zU9�I�~�����U�]�O̗%����%�Ð�)Dm�����Z��7��ۆ�M��zZ']�C�&[SB�I_����΃7�B��/C��.��/�!X�j�����F��7}|wH.�0��g����~�ei�� 2��b�p��4���<-F�U�X�BA �!fƋe5��~_��#rqd啍��niGc��VxV��_��I�|X+ǺG�qYhB�/��sIR7ˢ0[�4���`v��0�q�<�s��{W�z�'��Ψ|v����x��X�X���	�r�1͈hE�	oـ"e��&����|������|��ѹ�D"��a/p�s��+G��i����q��ՏT�R�R�%�-�֢�툥�6��+�n=~-  %y�]X`�]E���ݠPf��\S�����9��m L6Sl�$s���[R�
�]�CMB{�v�LHo'�y����βCO���ͻ���N�̱�#�T��f��(���ަaX�RZ^�
cE�|֢�p;F�����3r�-��L�!��N2��I:��C[����>����R$XE�2�ɄK4"LiX.T"HK#XQ�"� ��5�c�s1D����׀��}Fy���]���Z�O;{�P�G�ؤ�l�N��*�h�:B�
a-�c�!�\))ŶqOk5��RPI`�2��T��]`����z`�b���p�'ȓ)VZ:u���f�!�k.����}��({��f`CV�������r���o�T؝��"b�����d���Յcu�bD>���7ĮeAlv��G�p<��8��-	�'G���	cç��	�(t� V#����$���)�$�)Xi�(-�W4K^���9~�%�R�+ �|�e�L���c��Ռ^������z�6��.d?mc��Ų�bp.�F˰u���*������Y�(�!���^�ŏY�ڬU�ZbF��H�_G�ZZ��w��8Q��ZJ#�mM������h�����Γ��$�a`[�}�9�a�:V�Z9ҋ�P�����K�8u_��[��:�Q �k���8Ӄ3��*Ԏ�����=�:gA��	:j�k�B�p�Ir�(\�����([��C��S~�y<�@����ZJ/����x�a����MGk��: $3C�R]|?����w�F<>rF���Տ��%b��mXf��v/�?�D�.    g�g<aJ����j�����U�X�Jk��1�5T�ɺ��X/
�
4�ZQ
"p�I�1�,Տ"{G��������b�&9OVL�_��i�������A����m¾Q\�8����Tڤ��+Yk����&)�p�)J�Z��i{0����K$|T�"��0��}����ٶ��!L<XF���t�eVL(l$���*��Qy��]/�1���u�Y�Ӽ�
2�_f]IM�ͼ�vc���0R���p���K+PTٙ�����x�9����v�[���ō��<c	�*�`�B���Psb<9b
����T@|>|��C{���{N)tyd��};��#cT?N������߲���$o�V"e	#��w�r+q��?�D*(X��`��SPE���1L����?v;��J��lĩ]0lcW�h��%�*a�3�z5�$�q��ߡ��KA0����-%�E- ��{�#��x=��+'�'c{];�\x�n	1F���Ӫeݮ�7-~��2�ĳ��%�;@�. H	�*=j���ͼ�i睿�0P�Zڻ�ډC_�\w��<|�'Ϡ�¢�!3ا!�}�Hw�Q#�]�@���I�S�+�G��}즛���b]BI�D�J�+V�V|+q/Dl��d�/��vC�}��&�A-V�?�Of �?����RSa	�ĺ8)0�p��e���T"R��k�M�w��)��ٶ*�= ڭ��3e�`�u/�6#����|���i#�
�`d�|[
���K�TKe���\����.y�
7��(����=��K
o��?^�T�
���k)��.4�飅���.�Kz��k�"=j�31d6C��X��]�_/\�,��jT�X�MI�I/��1[��~�-7\�8C]��r%�8_Q�I�B��QX���K*��G����<������/���ݖ5.-�"���̣1[�Mm��^õ*�Y�E͜Ւ�:f+�T�����������-Mr/���%�����M�r�k9������p;\�f/.\�X4���n����+{
Z�������j<�G�+ mB[��BF����Y�m�}�`��ʂ���D4G�p�:������v�q�/�`�C[��G��ˑ !�âB����3 ͳ^�#��*�,5��\y�����J�ĵ[��Ʊ�*�{~Aׄ�vE\P-R/)_�0)��ո�i2P"��|$%(�����&dRl�`�� prS�uS�j��$詼���O��Z�c��q�K�_?&����G��t�� �ar���b���ïZ"@!L
V�Ơ
�������a�p�1C|
;�8ġ���&0g�k��ӻ^<
�N�i� �0���ec ��_A]AV������gX�J֓�Ǫ��0�d���!��I`�b ��.�p#Y
��3�n��$U������p#�����x�ɥ�5��h���U}Ԭ�xqJ��2qnA��$e7��`ӈz�.�:1��L���'a���@���q�[�"��T㦪IL:�[�|�Aʣ�I�%jB�/�
b+YB'<n�R��'��|:s�-S��*$��O�zH��@�,����}�ʥ�N��ZE�5�&�}�(|�W�0k�r,�H�(L"1�����$�+
#K�m�8����T���I~g�!f˫ԦzovPK�����F¾�G���A��װ�=R�"<����m#����b��\��I�t�u���7��ȏ�jrK��>G����q7un��,�&�],rC��Un�[�V-#H&'7�����m��f��-�ơ�+��KB-b[<��t�R�1��x�����|z`�z:���"R�%����n}�R�eוB�Jʪ'��C��t(��۶��������>z��㊊늕���J�UW����4ä��l(TK��	�.�n$�#y�����4I����G�U���x���l��J@Y��Ia#D�mC*����ҽ�+���%�_���c�J���tc=cB�!�$��P"_���r;?{��qju��wS����:�u�͗u�1�p�F?w-Y2��ʫ��"1�]��[��[䎥�25nϨq���
2P���5�:~��&���]���by�KS�fhQ��[v���/�IC��
p���`����?��KE�ߴ"��yI�2�~
���m��8���r���'��Ĥ��&���H�8.Z*\ʼ8����4{Kr	�P�8G�M_f����l ��9VT��50-��zv�f��s��uP��J3)�H&Q\^�;i���j��&n�_�!�D0����M�BR:�Z���#��`�W�Y��A	+w)Ga 2��o�އR:L��t���Ч��&��ܠ�uӳJ'J>:�/9��>tu�K�������n�� Ā�Ы櫤�����aV쇓�������g����a�OS�	;���]�,��zB�6?0� )��^�����K^�'.�wC�O�D�{��֠,3k�	�'��c�N�h)Jռ�D�)���T[kA��:Z��ы�5;��m�!#q�����	�_���fέĔ;���eq��Wa���_%��xi^L�U�o�@�p�@�ߟ5P�{1U`NAxs^0�m1zѝ-���?":�_�����S��Z�߮�~�`��17p���0��C>1D�?��ˣ�;�⾆^�XO��۴Ye���m�y�AE,�e��Y�����ffA�O]zDx^��o�q��s-��{���]�ݰ6��\ע�������Ș���8J����[�^��縠ks��E�����ɿ�JiEZ�}���#n=���E�ɪ�E��KqG�'�VW3|F/����:�㿄u����A�	u����0P�������ѫ�52h,�E^|�Yj
�<ֻ��՟%,����#�����"O�]�SF^����n�QRh��Y^�E��)]y0� �_q+���B�_m%���}��!����q�.�C�r�?��x��+CX?2��[������Ǒe"��`�d�g�7��h0<T?�Y�rh�!�z�%��A��W��+S�)
�]rz0#���,�DX���+;�6^��3�'��`��:2�3�k������7��n�hz>�[���%,c_���Z�`XN������]�<O�$p�:zPK�E��K�bf�j���Tߚwޮ�h����΅i@�Q�j}�Iz}��Vc�?n���Z�ɇju�j��!�$DT�Wd,Fjk��.1-��P�S�m�|{��a�k�F�6�=�7�bH�<u�>�� �eXr����,Ƙ?�(�%��$:i¨z&�֢��&w%q���!� ��G�N3	�����C"Ao��0ґ���T�i� b[au���4J�0}����M��Ha�Պ�3�Ŷ�fX�Ŧ���D�!I	�4$/�i ���J�!e͖����J�n6@jfY@�}w�u�Ja(��4�̞J.��4�0�T�P>Ҽ�$�"6�۟��E+�D��K|�y��Vd���nE��QE� ��o�a���3%kB��'�=���@�U*�����0��>GJ�*�d�֤�Lէ�4�j4Y���Gen@�J��EsZ��DV'x����0�mB�0�[�~O�ِ�[�=�d�F5�yO�q�:y���^��I[?��������,�m��|�3��_r�������q���6V�i�h��d��p�p���Zѧ��&����S�:�+�*WK�R�����ޢVrE����m���+pf�(^hhn��Zl��`f���V�z�N�-9��xX_'R�։�j*�I�J;����Cj���*����	��`��/�@QOM���T�b�k��l@b��K�$ē᠅F%�]� Ww,�K(�X�I�S*b%n!4����b�1�lKǑD@�%ф<�E��xA`� ��'�J�<9��HRJ���:	����oj��Ź�Ν�h-��f�+i 齰���`Nty�SbVv��R�y���D]߅A/9@�#M �á}�7�pl%
HcŰV���K���pJӶ���ťoV�VEy�+˪�OYb�x�i��t���5    w����b���`/�e��(r�'0J�h�-�c�Y�lچPo�#�I1�&tl����E@U"Ȃ��w�/*�gD����d�𴘲��"�J�@��|J��-���2Y˓�ɾ
�ow�"�$ƶ�R�/�U!հ�O�
_���Z���%G�H�_'XU�����ҋ��R�ϣ��
���(��}�����(.~���/�+�OZ�w���}=R���+'������`�+&����
q���^QҢ�S�o+f��y�a�u.�kBq�-[�{��&�K�Ɇ�.X,
Q�W��{r	uɒQ�@T��2�n��_vVhr[�zO� CFV�ژ��ة��K��mL�ߵ�l���ѲM`�����EO��f�C2,ֱ��Ղ\�)<�?�B�6������X���Ixm7�0[�X�9?��l�U@��<pԤ�,��V�)V�>�Xk�(u��j�<���ڠ�Ř��ԩpC�OeU:*|�s��5�����E�h���`�b��4�e:��x5�7mL�J���JqiHq�������#�=�������\kl����w���$7ޢ	�cZ�¸v��Jn�\[z�(+t喼\�����~Ĳ�W��w�>�ɇc�MJ�<�n"Z�*L]�Ķ���pѡ۲]sdʷY��v�f�j�U�+g鉹^װ�v�f�_"«�WO�S��m�w��ǰ��ɢm�ӹ�KH�5N#
e���e��~�ǣ�g�	����m�.���S�\|��m=�O�|�{N�R<�ia���8{Q�K�Gh�u�R�J��+{|���^�2��Y\vlk{!�[_�ng�~��M0d�Ұ:#� �N���d:>!�U�bim 1���)ީ{S@ȡ��2�hM�ƫ�)DI����"R��*(?h^C�↥�lx��
+l��Ƞ]���҄S�L��ŕR����	�����/Y�퟾�_!�����@K�D���=s]���u!��0�v A�,c
)7��'�6,X���p5Dsn��GG'H���0�ȱݕ�;�mc�4�2,�E$#a��>�j-U'��Q:ܡ|��?ˇ�L}�cu�J��
wW���T�*1��E�;�T��9�F��7ٳ�rl�E���j�m]���/�����ˣ��$�T�ay�o��Nѭ�)��$�Q��9�M��lTo��o�<(8�s�d�������j�n�IR��'�-lU��B^>��m|@��~��HR���y7'�_��
s�����!�dTKؗZ�'�0q3r�E�=sԤ�"�*@e�
t�v�`�I��%#055L�f�燔a����]t{�����'��*3�W����a�#(��z�ZG�c�Q���~SX��A�a�Q�x�	��Ն�qE�����(���mw� ���-�j���#���8��#������ٟ�|@�[���g3`�\s�������&��M�IQ7=�m�<��N�5EE=}�CS��������D9�J����p�v0�)"nC.&8�Q�t�|��}�H�����i�a/D�6h�� gէ��B;�5	e]�)�;Y���۽ ���t�_6̡��L�u��9���m
����o�!,!�|F����%Xs�=[Vs*%���uܕ&�3F?�D?~+�OŒc(__t��S�3��_(81Ͼ̷p�v�uե�˒�&5�j5N�/ǩI�$��9
��)JGeIk���v��v)=8���f�pk�C����迦���s��E%��ugs�g�Q��ρT�H�w��c\j�X�l����w߿�eey�P���"-�mg+[�e@_źW���6o��0���T�K�W�jT���I�q����X��k}��\�fE�)å������;*V^��ҕ��Q�0$NǷ����p�[����Gܳp��xԖ4���wl�5�
�zWO8������忲n�r�"oD�R�Y�.�d�d��[K?¬b:��O0bAX��>�;ǃw%���y�}6C��&�'�8d�&.:d@�U��*1Fl��>�k�'|n�AR�ӝE
VV��Z82b-H����:�e��i;��<h��a�5�eɰ")��7d@����xF�(򭆤ĵ�����C/_�m����^�a����J��=���T��=���5�
K�	�ʰ�PS���X3L��`�x������<.�c��]o(��hYڗ���7���c4`rWx_B$jm�&��n���K��N̄i����zۣa�6py`T551������g�=a��	�T�%`b�Uwŗ���&�4)Ƭ�It B�T��o�+}G�$Ř�&�WX���e(2!�Wa��N;��Ĭ���풟2�,��ՖYR�r���A�H[a����t&,ܬ	U��3Q�����M��_u��h�QUm�����d=|q���я�"L�o�W���,�	���0G��e1��t��Y�� �by����-5���tP��()���~1�K�H��yV�� 6���h�t)5)�e6Qk�Ȍ�+`NVXQQfBA�#:�a�N��Q��D�s��	Pf�挫9>9f�M��~
3in�Q�P�BԉXS�>�Bt�����g��0D���9�X����S�Rf�+�z����milz@�7�f�Y{3��y��y�8T#SXҾ�)ÆUu�h�k��KI
;KPʎ^J:�70)��Sb���ߟ��e0
�0EքoK�F���7�3�l9j���5k�3�ZNq~)�yd�=��V&�V�LL��y����4�� ��n���\�(TKqh��LI�N)�K�x�ܫ`��i��<�ǹeY�Ӯ���`hχQK����E;՜Y��!�1!�����)|C1S��m���I�o�q��/k^��|�v���!�a�J�+�0�9�U����n��Ve,Um��+,�̏�|U%�cT�����:���qǪ�f��]r1X���{�eU1�6�TUmY������}����Pi��+0Y�%��R�v��n���� Y�v��b2�wC��|`�"L�(��@�1u�L(l3w��l�X����_��y����#��{�D���W���`^{'k��*�E������YQ<ܻ~�E��0M��}7pel�������5�|㡏�i�I��a�53�ֳVS�T�J&��� ����U�I�k��xB�a�x�pZ�_Z����ڴ�Z���f����1�-��}��#o�g�k��ZQM�v�g�(�;�'�6�)Uv5Ʈ�6T*ۑyd�$5�N͞}y�nI͞X�b��Z���X}�[�1�߂}�S�����wu��|:�~����Q ۯ{�S/l�O׫�����Qi[R��&��i*ƺVƌZ@�Kj\(*�t�lx{���˵a˂:�U�,����M���	[ޞT�޻��(�g���|z[P�ބ%��U�$|ĸ��-X���C����@7T�>G�Us�?���v~{��Ii��8k�p��՞{Ɲ&�����F ��;j�'k������q�I9$-��0F߷T�jɎf�S̨��v�cC
x�%�bPժ���-��M�Yv�P��r�2�vk��;�mWL���c ]Q��B��:�+��B+���;Ȩ�M�ǩ�5GF�n¦໷���t����/Ӿ�~1�9w����MUo��Ё�M�`��$s��-*� Dj�Š�x|4��&���V�kX��XP�����U����։����&T���F���(9�����g���{
�����I���R���wt�{��e��\�X�M"��a-���7�Q�[����,����CE�X-��ʉSfR��=��z��0Q��.���N3���ڍe�3�����jc�O�w$b�D՝�8��Iڴ� 5P)^�O���kU>׽'�K+����,�������{(��)��d�8�{�7�2��_��5m7�Ֆ?�ܒQ�0�C�˭ ������B��z�#��G��\\�����O�8���˽hF�o�|>���Wՠ}�P�Cn�v���Н��X4��}�g�H�	�1�o��ޟ�4���k7��TI�{%4������S�\�X�^*���!Z����    �"�m�8�k�`j��I���!�v�ʉ���7���<��`J�ðm��B�}�*7���*?�֕ �����D}o�R7#j�(͇,��ߙ@�����rs-/B�/�͢X��m��ZP
5�%�aUmh٧��RW0�����,ix�4�����`�6�ӻY�<��v�P���j��=�7��M��n�͊��{@I=�q�i�\f'ͫb�*[(h��]re��mևݗiDN��d2��/Q�T$ ���!�9���b�nlxFa�-8H�(�� ��d�`d i(��g5�d(�S��_��-9&rv��%y�;���Ӓ<B����e�
|��n�O��H�鿇�*o[���ϟ�5��҈;�1�c&_V�p}��$�0��|\���:�y3�7����-|I�"=x78��nq���#@�[�q�|�n���mQ������Vd����n�:G@���:Y n��Am� �{�[��2���y������;~�. 0"�ݩ<��� �ɗ@迁��O��_�kд���S{��YC��<�LLE��X�ɒ�Ԅ�'�l�����u��6���6QrT��,�A��=x��qY��[Y֊qK�s7L��$ٹ����
����~>���Zs>�=�z�j9������ ��w�fi�G������x8��Cp|QOВ���e���� ܍:�T�Q;> ���j�'��p���F|�ѓc�<u�X��LJs�ѥ�t�+z��)T2���v����-�
��S�k�c'68o��%s67�P�N:10�ICz]l2�?c��`��F��"��baW�냅�ܯ�`�1Ia|*����o��BuJ����w�B"�=�=)$��~�?�`f?,;j���$���1n�Z�aSs�>s��H�L��"��n�f�J�c2�A�Xb��P�r������K
n�ŷSR���v����Jj\މ�U��������l�T�w֒Q����O���k)�G�
¨�h[��E���V�����B�� |0�
^U�T\�4%����Vn�NYb�T��?��T��^��U�T���x!-㭧�[*\��?M��70Ov-u�*W���Q�=]x[�5�`�W��D���`?�]l���a�����透Ѯ�Ʀ�6�򥖆U�J��-�1�kЖ��{�c��y���%�qO("vM΢� ��N��՗����)8���X ��!5�O��CO7��uć�F
�����l�a�?�`�έL�Y�2|�erB�y꿮�nħ�x=�����g��0�gC�5�[�p�����?�D~�o���}W���m������Z��V��uZ���8�ho�\�
D��s���ڭo�� [��u�p�ˤR��/pK���+H�1��A
^����ݶ�e�_ֶ���	ݍ���6�6�į���xدߎ�'�mcQF��/41�~͔.�tW��G� �t�����&�R�oG;6�e4ĺQfe���dP��&ê���jB����Rn��a�d��/]�f�2R#��>E�N�����E��(�,�m�Ak\Q ����q�x�gs�
���!Wn�	�p�X���;��Օ$P����?O��2����)j�ɼo�V�7K#��*b)h�q@���.M1">���>Y�����!������@������E^� ;
�XM����Ă���W	�`�ے��R���
��K��aul�-�8� ��.�P���*���$���W���J
]]�2я4�����8�1l��^�\����hK�Bw��+G���0�z)d�(�2���HT|��iKaD�2����č�/����߭v2��R�q��VR��^�%�%gzh�����!}^�n!ʟ
R�Q���#��_vL�52���ю5�ZE@1l6����bo��B��4��p.C4��O�¦-���l��X!�fUN�>O�İF��F�ꮢ��EH�:�m�9w��t3?r-�P$"��~�N$�����e���C�ƲfH��OJ��QK��n^Iᴉe��ǟ��5w���*+��Q��PVI�؟^��h{d�\_�B��rc�Q�bG�2�k�'���S�%� �����h�l-st��k�3_�#@ݐ131�'HK���,����M�+8V^�AG�"+�&l2M�Qs.��`���?�ɰ�`��j?씽#`.���-�`!�����˰R�4���P%d���hj�����e����`�H�M8������Q������bڭ�L.<R$�ܔ'fI*Z�'.��IT�ϙd��_\[�����E���G��ы��\�7���тrI��m�Z�$_��W�����i7�qHJ�pBM��$��p���v�p�y�|1��G�ut�yH�ȳmK�!�H��m�Qu��9nk!.���b��E�-��G�wdM '����z���o�'H��8���VǴ�u>�ù���@M�X��7��ɚBj��vr؊�>��s�_��I���aT�T\;����E�V#P2}��.�����<��8�N�a	�J8��H���3%�쬸V$9�������2��ג��R����o1`{=ui[�x4��5R����y[a]�Ƿ�|{Cn8!;�& ������7c�Z;:#W�4$�6b�\S�o�;L^Y!�;��Z�����k���Q��W��ޖ�.o�M�x��V	e�?ԕ�O)PQ���L:2�-H��]D�7K5��7�|�H��E�|b@Bf�`|�E˗�^��˲w�����-9?Q�n��4bV�4Uӽ�%�h҇�s�w�"�N��!󎊦�R�d��m*��-9w��8CC,�`�����
z.y9"*��AT/�V�{��z��v�xؔ�4v�լ�)���'�WؕQ/Ơ��F�U/fo�*<l�[
�M��o�Ɩ-`R]eqE5�n?���i�عJ:W]��w3F�b^�����5,HV�L��ۛ��j�����/ �no�&��ƞ�b�����b�5�no�C2x7ظ-Cy���r��ol�� ��-�QC���8y��[��҃�,P�C�vǰ{�zG�7��I5S/6����<����-���a�_w�}ۛ�,eRk7d�ҙ��Hܡ<�}PmN�`�Kb��9�7>�%�T���+�M`:��5+��ݻ��"e;uW�_����gw���`��}���*J;,խ��*YE0��֟�Va�u�-�Jظ�ηR�5N�[
��a/s�Uy����a����cQxEY�܁��e`���H5���l�Ǧ���b��a���4sx��B��,�K��Jv�c��N��0�S���Gj�s�30J��y3<N���8q��Ά��R��ᗊ��-b�~h��4>ow�S��M�6Pޮ�x��2�n�=3�{����z�E�xQ�k�w!�W��b �����d ����{�f���5�4W)�'p.��i�i_1�jp���r�jQ�yH���%��G} �l�A�K{�Y�������;k��BN�lׯG�"'�����¸�s1l�(���n��e�޴�S�=��H���z���W�׭�Sj��B��3ROF-@�AFqW�vŹ7K�mރ��j.�T�L�s2�Ei��_�Lr�T����e�Y0��<����/at��_��������
������~���G����0����4��Hh�R�^)�Bhϋ�����	�C0~���㧠����,D9�u�k-��x#�gjQb�LY�ڲ4n�!b,����B3䖀�eT̨٫�����=g"�x8V)s�fӢ*Y}��x����
ْ@zq�Z�eWs��Ff�Z�V�e�G�
�(�}q�,G�/,��W<���b9��r$S�Ó�wj$F�r)x'�iܑu������t yW�+�˼O�u$=�?O���v~x�^RhF-�P���D֊�%?պ���X�[�į��z�HKC3�q���m�%���<8W��[mr-������`���b�R4%ˇ��5�n��w6���Լ-�l]Y�k�	{7�3~�-ػA���J��nZN�F�����D2���� K  ޯ�n��rɐ��w�-��C4!п���a}⯰mxi��풳���O��/Z���%!B¿G=h�2^�ā�21�Z��#�[��Z,k����m��������>w���8�:��;K��-�:�F_�l��2ُG�*c W�6~4%��aycO���2l�	H�U��P�K#��^���9��6���Tqx'�ȕ���D ��n\�������t@�� ����T����-aI���]|�%5�y	���͋�FIՇ$�@s���.ڔU�Ԣ�*%ƽtI����n���XR�!1���K�s@��t�������sw폐����RR��ό���C��6G�Tj���ٽ�%%P}�6�s(�ZRր�׬�Z�(b��^��Ws3��h`߬6Q%5	��F�bԿV�lègͺ�Q̚�:�_RG �i��بb�6���w�D�h]�#*
D�;��������j�M&�t��������A���D%E\�B���&�gKq*�YR* J��� �,�E��̒�V�b�VR/��p�O'�)* u�/�Z I�����Wag��İ	0����h;_G��q������}Da9 �����d^>-˧ń�P����d��sc�7�9PJJ�y�_�v����c�u�X�8�uX�'�+�ޅa��:q��~W���oڍe�D��d�Y2^$qɒy���ůr�
�qD:�H5H?k����(��M�Y�I�,�M��T�<J�k�ʟ@,k��ڟ��$�@l�K��
�C���u���'Deߪ�8��Z����L���a"���i��31S>VMY>h&ͧ���B֪�����O(�sTvՖ�%xn�V�ֵVD<�u�;d��|)K%�M���d�c��ٮ=�P2��R��>�̲_7�8�ɨ�H�+/�@���H��Lпl'�9�&��]�l{(����`7K�/@^#���b��)(�Hm�G1[�R��7�%�2#M��%y=�z�Ytp��/��3}�f�l��e�b�4�cʕ49=~��Y$z+���U��tӴA�٬��¦����G���OS�D-~TL�_��/T��M}!��u��Es�ľ_���@�d.g��J�=%��ҕ��-��� Q{]]�i����uv�mX�(��=��7��8<�J醖���Q��<��)(
ϱ���MT17�s3���Rt��~W[�v�C�)� RIr�er�� g�ɔ4������(�㴾w_|"�5�{Dk�������O�������8ɶ�bB>e�-�L`�P O��M�ۚ2��ø�� ���4�o���u�W��ygqˊI��C�"*�i��-�	����0�@/<�{�"��G���F��;3+�c؞��2!�c��^Ū��%������#t�`�d���t���cg~:� V>L��k�9�><^b*�bn��9�*c��!S���!Z��	|��oK	u�A�eAE%@��%�?�0�!opN�0��?�_E�J ����:�0[n;�m+���P���]&���P�LsdKz@�Z�9������h�qL�8�(��{�2�
a|�8���5V�nL��4���*(����9�A�۟��0��e��Ð4DVe�����s���_���ke�z���$u(�w_=�P1��ݗ�l�5-s}=-.Bń�_��R1�������l/ᠥ�Մ��'܈;�+�d�v�ĭ��m)��@�OS8u��\f_/[,D&`
�����7T1	;
�+�P+��ŝ��?Aq?��T̵^�t����ۨ�m��41�ӈbZGwU���2pQ1����^;�<�6%�w�Z��`̡O�:㺻B/���������� ��q%x-�Z�G_�ry$�]ɌA�m�s"��
�_$�],��F|�쬜	��p��:��n3�|���[�v��!DR]��^�Dq�V�5��������0�e>\�}q�#E]��bij���E�����>o�Q ��tq#h)�o��V���W�v������ġ
��bi���u�J۫�~ހ�~1[�Z]I���� �H*�*�a@5ôC������[�a��KВ��۱;{��D����&�'��*������}����3��.���tܧ��B�obC$�g��������;V�/<w�q(Ds3�Z���6��W�G��~����ϣT����q+M�ͺ	�dl{����e���I^4'�U���Sw�M�����=��M�H��]��8�I��������ϣE�*2?5N{�1()P)��H�y�@�2��e��!�5�wr�{7����#��C�Pt���q�n��ֹ����:2/�S`Z��Yw�kB����c.P� �K��߬A])����+㿘Dfd�����J�I�W��z#QsE�3�>a��J �۠��4���E��~� 2#S��������
�*#���9HT�U�c$5@~����?����;C��/��}r3�����f�d��y�Æ�HeVm �=�`��g,�L�0��¥o���a�~L����(�j�B��o�F����ˇ����&���
j�<w-Go���=��WAM�G�_��\��o��L����7�&�TV��_�~�q������M��B���pO�WX�x��c��9�5�sj0��quT��V�Շ�7| j��u*C}q6&̧u'j����N��r�c%����L�}��m^{�.�c���rPA���FVF���Z
8��C�Ej%v�;�B�i�݉L&�Hf��b�ȗ��`^��YU�;*P[+��?fj&S%z�Y�~`P�~��Z�~c�U������c�%/s���MX"���w34���|Fu^Qw9t��Y�ϻi��$H�}�0`�z�+��۳>(ɸ�6�B�6�����nE*��0aP8l4����y𯻁����&�;���þC�?�fE3�|�R�F�X��
E*��[�J3�C������BS���s0�׷J?��@
f�LET�F2�YFJ��*$0��t��u_#����p�_�=֌$F�;/}�O>�k����pd:��A`.�A~��)Jv���A�5�/�=+#1����M���G|۝e��X+���3�e$ ��&��D�q:���$=YP����k_ts�Mp� ?k�ݰ�*3R��#MFj�b���P�F&3�0�a�c� G⓰8��ߪ�"6�0H)�5\�0�&�%�+��r�{tq��)N"����Ze�y���ӫHF��a�7:d]��r����!�c W��O?�<B'^q.�Q��^��̓�r*$4�[=t!B/ �s�/�Hf{���Z�F�6�ț��$�������r�r����6j)��3t�4�p���?�㱿�ͭ���o��ԃ~7O��,,��~������ƣcue��ж���=mw������A�F���+i�j�^���A�-#�<�v�]��/�Ĳަ��n��z�Z���F9iehh^���ռlb����1|{��W��ۢ�6�n��2���8���E;/�l�s�PC�%o�3B��Zʿ�����Q�Q�0K��O�Uɘ��{TN��G�jo:G����&ȕ#d��`#LN�4���t����Ey�q �r��YL�/�A�Eg���+�H������?��{�d�         t   x�3�4��,I�U0�44ҳ��I-.IUHIU((�O)-��4202�5��50V00�#N�Ģ�D#NC= /Ə�ۄ3 ���F!eD��L9M����g�1���)rU� �\�         �   x�3�4120160䴰470�500��,�/R�)ͬR�*�K�42 I��Zr�&*8^�������wh����_��凷�s����Z�;��&f��%��r�64732�46���Lhd�k`�k`�```F\�&X\�Z�������O'G��t���trC� F�o�     