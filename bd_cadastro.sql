PGDMP  3                    |            bd_cadastro    16.3    16.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    24576    bd_cadastro    DATABASE     �   CREATE DATABASE bd_cadastro WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE bd_cadastro;
                postgres    false            �            1259    24613    clientes    TABLE     C  CREATE TABLE public.clientes (
    id_cliente integer NOT NULL,
    nome character varying(80) NOT NULL,
    telefone character varying(11),
    email character varying(50) NOT NULL,
    tipo_pessoa character varying(10),
    cpf character varying(11) NOT NULL,
    cnpj character varying(14) NOT NULL,
    rg_inscr_est character varying(9),
    cep character varying(8),
    sigla_uf character(2),
    nome_cidade character varying(50),
    id_usuario_alter integer,
    dh_alteracao timestamp without time zone,
    CONSTRAINT clientes_cnpj_check CHECK (((cnpj)::text ~ '^[0-9] {14}$'::text)),
    CONSTRAINT clientes_cpf_check CHECK (((cpf)::text ~ '^[0-9] {11}$'::text)),
    CONSTRAINT clientes_tipo_pessoa_check CHECK (((tipo_pessoa)::text = ANY ((ARRAY['fisica'::character varying, 'juridica'::character varying])::text[])))
);
    DROP TABLE public.clientes;
       public         heap    postgres    false            �            1259    24612    clientes_id_cliente_seq    SEQUENCE     �   CREATE SEQUENCE public.clientes_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.clientes_id_cliente_seq;
       public          postgres    false    216            �           0    0    clientes_id_cliente_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.clientes_id_cliente_seq OWNED BY public.clientes.id_cliente;
          public          postgres    false    215            �            1259    24634    sessaousuario    TABLE     �   CREATE TABLE public.sessaousuario (
    id_sessao integer NOT NULL,
    id_usuario integer,
    dh_login timestamp without time zone,
    dh_logout timestamp without time zone
);
 !   DROP TABLE public.sessaousuario;
       public         heap    postgres    false            �            1259    24633    sessaousuario_id_sessao_seq    SEQUENCE     �   CREATE SEQUENCE public.sessaousuario_id_sessao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.sessaousuario_id_sessao_seq;
       public          postgres    false    220            �           0    0    sessaousuario_id_sessao_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.sessaousuario_id_sessao_seq OWNED BY public.sessaousuario.id_sessao;
          public          postgres    false    219            �            1259    24627    usuarios    TABLE     �   CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    nome character varying(80) NOT NULL,
    email character varying(50) NOT NULL,
    senha character varying(10) NOT NULL
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false            �            1259    24626    usuarios_id_usuario_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.usuarios_id_usuario_seq;
       public          postgres    false    218            �           0    0    usuarios_id_usuario_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.usuarios_id_usuario_seq OWNED BY public.usuarios.id_usuario;
          public          postgres    false    217            $           2604    24616    clientes id_cliente    DEFAULT     z   ALTER TABLE ONLY public.clientes ALTER COLUMN id_cliente SET DEFAULT nextval('public.clientes_id_cliente_seq'::regclass);
 B   ALTER TABLE public.clientes ALTER COLUMN id_cliente DROP DEFAULT;
       public          postgres    false    215    216    216            &           2604    24637    sessaousuario id_sessao    DEFAULT     �   ALTER TABLE ONLY public.sessaousuario ALTER COLUMN id_sessao SET DEFAULT nextval('public.sessaousuario_id_sessao_seq'::regclass);
 F   ALTER TABLE public.sessaousuario ALTER COLUMN id_sessao DROP DEFAULT;
       public          postgres    false    220    219    220            %           2604    24630    usuarios id_usuario    DEFAULT     z   ALTER TABLE ONLY public.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass);
 B   ALTER TABLE public.usuarios ALTER COLUMN id_usuario DROP DEFAULT;
       public          postgres    false    217    218    218            �          0    24613    clientes 
   TABLE DATA           �   COPY public.clientes (id_cliente, nome, telefone, email, tipo_pessoa, cpf, cnpj, rg_inscr_est, cep, sigla_uf, nome_cidade, id_usuario_alter, dh_alteracao) FROM stdin;
    public          postgres    false    216   �"       �          0    24634    sessaousuario 
   TABLE DATA           S   COPY public.sessaousuario (id_sessao, id_usuario, dh_login, dh_logout) FROM stdin;
    public          postgres    false    220   �"       �          0    24627    usuarios 
   TABLE DATA           B   COPY public.usuarios (id_usuario, nome, email, senha) FROM stdin;
    public          postgres    false    218   �"       �           0    0    clientes_id_cliente_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.clientes_id_cliente_seq', 1, false);
          public          postgres    false    215            �           0    0    sessaousuario_id_sessao_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.sessaousuario_id_sessao_seq', 1, false);
          public          postgres    false    219            �           0    0    usuarios_id_usuario_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 1, false);
          public          postgres    false    217            +           2606    24625    clientes clientes_cnpj_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_cnpj_key UNIQUE (cnpj);
 D   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_cnpj_key;
       public            postgres    false    216            -           2606    24623    clientes clientes_cpf_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_cpf_key UNIQUE (cpf);
 C   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_cpf_key;
       public            postgres    false    216            /           2606    24621    clientes clientes_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id_cliente);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public            postgres    false    216            3           2606    24639     sessaousuario sessaousuario_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.sessaousuario
    ADD CONSTRAINT sessaousuario_pkey PRIMARY KEY (id_sessao);
 J   ALTER TABLE ONLY public.sessaousuario DROP CONSTRAINT sessaousuario_pkey;
       public            postgres    false    220            1           2606    24632    usuarios usuarios_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public            postgres    false    218            4           2606    24640 +   sessaousuario sessaousuario_id_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sessaousuario
    ADD CONSTRAINT sessaousuario_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);
 U   ALTER TABLE ONLY public.sessaousuario DROP CONSTRAINT sessaousuario_id_usuario_fkey;
       public          postgres    false    4657    220    218            �      x������ � �      �      x������ � �      �      x������ � �     