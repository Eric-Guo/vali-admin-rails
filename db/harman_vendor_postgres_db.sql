--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: circulars; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE circulars (
    id bigint NOT NULL,
    title character varying,
    body character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: circulars_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE circulars_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: circulars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE circulars_id_seq OWNED BY circulars.id;


--
-- Name: companies; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE companies (
    id bigint NOT NULL,
    name character varying,
    city character varying,
    district character varying,
    address character varying,
    managed_by_company_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    rank integer DEFAULT 2,
    approved_at date
);


--
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE companies_id_seq OWNED BY companies.id;


--
-- Name: company_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE company_users (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: company_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE company_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: company_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE company_users_id_seq OWNED BY company_users.id;


--
-- Name: course_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE course_users (
    id bigint NOT NULL,
    course_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: course_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE course_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: course_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE course_users_id_seq OWNED BY course_users.id;


--
-- Name: courses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE courses (
    id bigint NOT NULL,
    title character varying,
    address character varying,
    capacity integer,
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    published boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    body character varying
);


--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE courses_id_seq OWNED BY courses.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    failed_attempts integer DEFAULT 0 NOT NULL,
    unlock_token character varying,
    locked_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    title character varying,
    phone character varying
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: vertical_market_circulars; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE vertical_market_circulars (
    id bigint NOT NULL,
    vertical_market_id bigint NOT NULL,
    circular_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: vertical_market_circulars_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE vertical_market_circulars_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vertical_market_circulars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE vertical_market_circulars_id_seq OWNED BY vertical_market_circulars.id;


--
-- Name: vertical_market_companies; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE vertical_market_companies (
    id bigint NOT NULL,
    vertical_market_id bigint NOT NULL,
    company_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    approved_at date
);


--
-- Name: vertical_market_companies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE vertical_market_companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vertical_market_companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE vertical_market_companies_id_seq OWNED BY vertical_market_companies.id;


--
-- Name: vertical_market_courses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE vertical_market_courses (
    id bigint NOT NULL,
    vertical_market_id bigint NOT NULL,
    course_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: vertical_market_courses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE vertical_market_courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vertical_market_courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE vertical_market_courses_id_seq OWNED BY vertical_market_courses.id;


--
-- Name: vertical_markets; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE vertical_markets (
    id bigint NOT NULL,
    name character varying,
    admin_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: vertical_markets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE vertical_markets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vertical_markets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE vertical_markets_id_seq OWNED BY vertical_markets.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY circulars ALTER COLUMN id SET DEFAULT nextval('circulars_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY companies ALTER COLUMN id SET DEFAULT nextval('companies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY company_users ALTER COLUMN id SET DEFAULT nextval('company_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY course_users ALTER COLUMN id SET DEFAULT nextval('course_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY courses ALTER COLUMN id SET DEFAULT nextval('courses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY vertical_market_circulars ALTER COLUMN id SET DEFAULT nextval('vertical_market_circulars_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY vertical_market_companies ALTER COLUMN id SET DEFAULT nextval('vertical_market_companies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY vertical_market_courses ALTER COLUMN id SET DEFAULT nextval('vertical_market_courses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY vertical_markets ALTER COLUMN id SET DEFAULT nextval('vertical_markets_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2018-10-24 02:25:02.803038	2018-10-24 02:25:02.803038
\.


--
-- Data for Name: circulars; Type: TABLE DATA; Schema: public; Owner: -
--

COPY circulars (id, title, body, created_at, updated_at) FROM stdin;
551060560	技术认证培训在线注册系统正式启用	⾮常感谢您使⽤认证技术培训在线注册系统，此系统由哈曼专业⾳视系统事业部特别订制，旨在重点强化技术培训⼯作，完善客户管理并提⾼⼯作效率，以此确保哈曼专业产品和系统能够被快速并正确的运⽤，从⽽真正为最终⽤户带来⾳频、视频、灯光及控制等集成化系统的完美体验。\n\n系统建设得到哈曼领导层及⼈⼒资源部⻔⾼度重视并予以⼤⼒⽀持。整体规划将会在目前基础上，持续开发以涉及更为⼲泛的应⽤，同时也欢迎各位合作伙伴能够积极参与，将您的意⻅和建议及时告知我们，在此我们深表谢意！\n\n在使⽤之前，请您仔细阅读此⽤户使⽤⼿册，如有任何需要帮助，请随时联系我们：\nEmail: johnson.yang@harman.com\nMobile: 180-1756-5038\n	2018-10-24 02:25:27.587012	2018-10-24 02:25:27.587012
551060561	VM账号发放	各位哈曼垂直市场经理：\r\n\r\n系统默认账号已经发放，请登录后即刻更改密码，并妥善保管。\r\n\r\n注意：请勿回复后台邮件。如有任何问题，请联系：\r\n杨旭 180-1756-5038\r\n\r\n——哈曼技术认证培训在线注册系统	2018-10-24 02:51:07.13085	2018-10-24 02:51:07.13085
551060562	欢迎各位注册用户	尊敬的各位合作伙伴：\r\n\r\n经过多方努力，哈曼专业技术认证在线注册及报名系统，目前已正式进入试运行阶段。\r\n如果您在使用中发现任何问题或是使用不便之处，请随时告知我们，我们会在后续更新中进行优化！\r\n\r\n在此，由衷的感谢您的支持和积极参与！	2018-10-25 01:59:08.605458	2018-10-25 01:59:08.605458
551060563	[Soundcraft Ui24R技术认证培训] 预告	各位尊敬的AKG/MI注册用户：\r\n\r\n兹定于2018年11月20-21日，在哈曼上海体验中心举办主题为：“划时代的产品，迎来划时代升级” —— Soundcraft Ui24R网络数字调音台技术认证培训会，内容将涵盖：\r\n1. 全新理念的用户操作界面及操作方式\r\n2. 全新理念的系统构架\r\n3. 重大升级详解\r\n4. 多种市场应用分析\r\n\r\n我们会在本周内，完成具体课程安排细节，并通过在线系统提供报名，请各位注意查收邮件。\r\n\r\n感谢您的大力支持并期待您的光临！	2018-10-30 02:08:22.845542	2018-10-30 02:08:22.845542
551060564	关于后台维护时间说明	尊敬的各位注册用户；\r\n\r\n系统试运行期间，为避免后台维护与您的使用产生冲突，现确定每日固定维护时间为18:00-19:00。请各位尽可能错开此时间段进行二级经销商注册，以及培训报名等操作。\r\n\r\n感谢您的理解和支持！	2018-10-31 07:12:49.110639	2018-10-31 07:12:49.110639
\.


--
-- Name: circulars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('circulars_id_seq', 551060564, true);


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: -
--

COPY companies (id, name, city, district, address, managed_by_company_id, created_at, updated_at, rank, approved_at) FROM stdin;
652367030	哈曼	上海	杨浦	宝地广场	\N	2018-10-24 02:25:27.559615	2018-10-24 02:25:27.559615	0	\N
240803873	一级供应商测试	上海	静安	茂名北路	\N	2018-10-24 02:25:27.559615	2018-10-24 02:25:27.559615	1	2018-10-24
56517518	二级供应商测试1	上海	浦东	上海国金中心汇丰银行大楼9层	240803873	2018-10-24 02:25:27.559615	2018-10-24 02:25:27.559615	2	2018-10-24
81938313	二级供应商测试2	上海	浦东	震旦国际大楼25楼	240803873	2018-10-24 02:25:27.559615	2018-10-24 02:25:27.559615	2	\N
561159139	二级供应商测试3	上海	杨浦	凯迪金融大厦15层	240803873	2018-10-24 02:25:27.559615	2018-10-24 02:25:27.559615	2	\N
652367031	广州市宏利科艺音视设备工程有限公司	广州	番禺	南村镇江南村南里路3号	\N	2018-10-24 08:44:45.782367	2018-10-24 08:52:29.593395	1	2018-10-24
652367032	上海梯捷科贸有限公司	上海	普陀区	上海市普陀区中山北路1715号浦发广场E座2204	\N	2018-10-24 08:56:09.134935	2018-10-24 09:02:54.426156	1	2018-10-24
652367033	广州市锐声灯光音响器材有限公司	广州市	番禺区	广州市番禺区番禺大道番山创业中心一号楼五楼	\N	2018-10-24 09:14:16.490632	2018-10-24 09:22:19.84777	1	2018-10-24
652367040	成都德聚仁和科技有限公司	成都市	青羊区	玉沙路90号机电大楼101室	\N	2018-10-25 08:17:44.211066	2018-10-25 08:19:29.928443	1	2018-10-25
652367038	广州市汇艺电子科技有限公司	广州	天河	天河北路689号1112之五	\N	2018-10-25 07:21:54.910959	2018-10-26 03:18:21.380292	1	2018-10-26
652367034	北京华辰世纪科技有限责任公司	北京	丰台区	公益西桥名流未来大厦713室	\N	2018-10-25 03:42:39.339854	2018-10-26 03:50:43.246512	1	2018-10-25
652367042	南京祥旭科技有限公司	南京	雨花台区	南京市卡子门大街2号2楼2509	\N	2018-10-26 07:04:56.249779	2018-10-26 07:08:31.773675	1	2018-10-26
652367043	陕西恒泰声光工程有限公司	西安市	雁塔区	唐延路旺座现代城B座2902室 	\N	2018-10-26 07:11:50.880501	2018-10-26 07:14:49.981772	1	2018-10-26
652367045	北京爱新聚福电子音乐设备有限公司	北京	朝阳区	科学园南里中街京辰大厦A座B1	\N	2018-10-26 11:34:52.878739	2018-10-26 12:22:59.862853	1	2018-10-26
652367044	北京鸿合智能系统有限公司	北京	海淀区	北京市海淀区上地信息路11号彩虹大厦北楼西段西207室	\N	2018-10-26 09:39:52.355535	2018-10-26 15:09:29.342705	1	2018-10-26
652367046	北京南鹏兴业科技发展有限公司	北京	海淀区	中关村南大街17号 韦伯时代中心C座15层1511室 	\N	2018-10-26 12:21:28.421761	2018-10-26 15:09:48.454777	1	2018-10-26
652367047	秦皇岛市嘉韵电器有限公司	秦皇岛市	海港区	红旗路46-2号	\N	2018-10-28 02:50:45.755257	2018-10-29 08:10:56.854434	1	2018-10-29
652367048	上海华演创联文化科技有限公司	上海	静安区	灵石路709号36幢B座	\N	2018-10-29 09:32:56.372614	2018-10-29 14:14:42.175127	1	2018-10-29
652367054	福建音桥电子科技有限公司	福建福州	台江区	五一中路132抽纱大楼2楼202	\N	2018-11-01 01:11:13.084019	2018-11-01 04:45:12.411413	1	2018-11-01
652367055	上海凡歌电子有限公司	上海	黄埔区	河南路489号香港名都2楼L	652367031	2018-11-01 02:21:29.952466	2018-11-01 04:45:18.826691	2	2018-11-01
\.


--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('companies_id_seq', 652367055, true);


--
-- Data for Name: company_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY company_users (id, company_id, user_id, created_at, updated_at) FROM stdin;
880532870	652367030	441287711	2018-10-24 02:25:27.579354	2018-10-24 02:25:27.579354
693164619	652367030	731953277	2018-10-24 02:25:27.579354	2018-10-24 02:25:27.579354
624283908	240803873	4183623	2018-10-24 02:25:27.579354	2018-10-24 02:25:27.579354
635775063	56517518	947767135	2018-10-24 02:25:27.579354	2018-10-24 02:25:27.579354
138128063	81938313	175981649	2018-10-24 02:25:27.579354	2018-10-24 02:25:27.579354
533505666	561159139	636832871	2018-10-24 02:25:27.579354	2018-10-24 02:25:27.579354
880532871	652367031	1061118110	2018-10-24 08:44:45.807207	2018-10-24 08:44:45.807207
880532872	652367032	1061118111	2018-10-24 08:56:09.139403	2018-10-24 08:56:09.139403
880532873	652367032	1061118112	2018-10-24 09:04:06.014629	2018-10-24 09:04:06.014629
880532874	652367033	1061118113	2018-10-24 09:14:16.496867	2018-10-24 09:14:16.496867
880532875	652367031	1061118115	2018-10-24 09:30:49.510676	2018-10-24 09:30:49.510676
880532876	652367031	1061118116	2018-10-24 09:31:43.060288	2018-10-24 09:31:43.060288
880532877	652367034	1061118117	2018-10-25 03:42:39.34522	2018-10-25 03:42:39.34522
880532880	652367034	1061118120	2018-10-25 06:30:55.679093	2018-10-25 06:30:55.679093
880532881	652367034	1061118121	2018-10-25 06:34:03.744892	2018-10-25 06:34:03.744892
880532883	652367034	1061118123	2018-10-25 06:35:40.832549	2018-10-25 06:35:40.832549
880532885	652367038	1061118125	2018-10-25 07:21:54.916019	2018-10-25 07:21:54.916019
880532890	652367040	1061118139	2018-10-25 08:17:44.216134	2018-10-25 08:17:44.216134
880532892	652367042	1061118142	2018-10-26 07:04:56.254735	2018-10-26 07:04:56.254735
880532893	652367043	1061118143	2018-10-26 07:11:50.885273	2018-10-26 07:11:50.885273
880532894	652367042	1061118144	2018-10-26 07:16:20.381966	2018-10-26 07:16:20.381966
880532895	652367042	1061118145	2018-10-26 07:17:44.766815	2018-10-26 07:17:44.766815
880532896	652367044	1061118146	2018-10-26 09:39:52.362357	2018-10-26 09:39:52.362357
880532897	652367045	1061118147	2018-10-26 11:34:52.883955	2018-10-26 11:34:52.883955
880532898	652367046	1061118149	2018-10-26 12:21:28.427972	2018-10-26 12:21:28.427972
880532899	652367045	1061118150	2018-10-27 11:42:50.96651	2018-10-27 11:42:50.96651
880532900	652367045	1061118151	2018-10-27 11:46:54.205867	2018-10-27 11:46:54.205867
880532901	652367045	1061118152	2018-10-27 11:48:52.415746	2018-10-27 11:48:52.415746
880532902	652367045	1061118153	2018-10-27 11:51:34.375364	2018-10-27 11:51:34.375364
880532903	652367047	1061118155	2018-10-28 02:50:45.761528	2018-10-28 02:50:45.761528
880532904	652367048	1061118156	2018-10-29 09:32:56.379229	2018-10-29 09:32:56.379229
880532908	652367048	1061118182	2018-10-31 07:24:52.987761	2018-10-31 07:24:52.987761
880532911	652367054	1061118186	2018-11-01 01:11:13.088672	2018-11-01 01:11:13.088672
880532912	652367055	1061118189	2018-11-01 02:21:29.957153	2018-11-01 02:21:29.957153
880532913	652367031	1061118190	2018-11-01 04:54:47.95008	2018-11-01 04:54:47.95008
880532914	652367048	1061118191	2018-11-05 04:03:19.436239	2018-11-05 04:03:19.436239
880532915	652367048	1061118192	2018-11-05 04:50:58.813692	2018-11-05 04:50:58.813692
880532916	652367030	822325298	2018-11-05 12:42:58.786067	2018-11-05 12:42:58.786067
880532917	652367030	946014013	2018-11-05 12:43:39.192115	2018-11-05 12:43:39.192115
880532918	652367030	1061118109	2018-11-05 12:44:00.005624	2018-11-05 12:44:00.005624
880532919	652367030	494500638	2018-11-05 12:44:17.014083	2018-11-05 12:44:17.014083
\.


--
-- Name: company_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('company_users_id_seq', 880532919, true);


--
-- Data for Name: course_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY course_users (id, course_id, user_id, created_at, updated_at) FROM stdin;
375138627	56320775	441287711	2018-10-24 02:25:27.571931	2018-10-24 02:25:27.571931
4943954	56320775	731953277	2018-10-24 02:25:27.571931	2018-10-24 02:25:27.571931
375138628	1007196942	1061118189	2018-11-01 04:55:15.772001	2018-11-01 04:55:15.772001
375138629	1007196942	1061118110	2018-11-01 04:55:22.974739	2018-11-01 04:55:22.974739
\.


--
-- Name: course_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('course_users_id_seq', 375138629, true);


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY courses (id, title, address, capacity, start_time, end_time, published, created_at, updated_at, body) FROM stdin;
56320775	SVSI 系统认证培训	上海体验中心	30	2018-10-21 08:30:00	2018-10-22 16:30:00	t	2018-10-24 02:25:27.583021	2018-10-24 02:25:27.583021	尊敬的先生／女士：\n\n我们在此诚挚地邀请您参加，由哈曼（中国）专业音视系统事业部，在上海体验中心举办的SVSI 系统认证培训。\n\n\n此致最诚挚的问候\n哈曼（中国）专业音视系统事业部\n
85574194	酒吧音频系统调音认证培训	上海体验中心	30	2018-10-04 08:30:00	2018-10-06 16:30:00	t	2018-10-24 02:25:27.583021	2018-10-24 02:25:27.583021	\N
1007196941	Martin Lighting之舞台灯光	上海体验中心	30	2018-10-16 08:30:00	2018-10-16 16:30:00	t	2018-10-24 02:25:27.583021	2018-10-24 02:25:27.583021	\N
506801965	Audio Architect软件认证培训	上海体验中心	30	2018-10-08 08:30:00	2018-10-10 16:30:00	f	2018-10-24 02:25:27.583021	2018-10-24 02:25:27.583021	\N
1007196942	Soundcraft Ui24R 技术认证培训	哈曼上海体验中心	30	2018-11-20 09:30:00	2018-11-21 17:30:00	t	2018-10-31 07:04:39.476841	2018-10-31 09:08:18.627269	尊敬的先生／女士：\r\n\r\n我们在此诚挚地邀请您参加由哈曼（中国）专业音视系统事业部，在上海体验中心举办的2018年度Soundcraft Ui24R技术认证培训会。\r\n\r\n培训内容包括：\r\n1. 创新与发展\r\n2. 全面认识Ui24R\r\n    2.1 Quick Start\r\n    2.2 详解Mix/AUX/MTX/SubGroup/VCA\r\n    2.3 用户界面及操作特色\r\n    2.4 多轨录音和播放\r\n    2.5 内部架构分析\r\n    2.6 控制界面多种连接方式\r\n    2.7 详解重大升级\r\n3. 各种不同场所的应用分析\r\n4. 现场演示\r\n\r\n地址：上海市长宁区福泉北路388号（东方国信）B座2楼04单元\r\n时间：2018年11月20-21日\r\n\r\n此致最诚挚的问候\r\n哈曼（中国）专业音视系统事业部
\.


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('courses_id_seq', 1007196942, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY schema_migrations (version) FROM stdin;
20180609131545
20180618005511
20180729053923
20180818014559
20180822125136
20180823164545
20180830105120
20180830143910
20180924043415
20181014075828
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, failed_attempts, unlock_token, locked_at, created_at, updated_at, name, title, phone) FROM stdin;
4183623	shin.php@gmail.com	$2a$11$dVaHVzmBsg1HFbhtZHBPseqFVrVjAKBQKngf0mfEhoAoGPyFCUG0u	\N	\N	\N	0	\N	\N	\N	\N	\N	2018-10-24 02:25:27	\N	\N	0	\N	\N	2018-10-24 02:25:27.549837	2018-10-24 02:25:27.549837	一级供应商测试用户	Shin	+8618502168366
947767135	tyye@gmail.com	$2a$11$dVaHVzmBsg1HFbhtZHBPseqFVrVjAKBQKngf0mfEhoAoGPyFCUG0u	\N	\N	\N	0	\N	\N	\N	\N	\N	2018-10-24 02:25:27	\N	\N	0	\N	2018-10-24 02:25:27	2018-10-24 02:25:27.549837	2018-10-24 02:25:27.549837	二级供应商测试1用户	IT 经理	+8613600804680
175981649	tggyye@gmail.com	$2a$11$dVaHVzmBsg1HFbhtZHBPseqFVrVjAKBQKngf0mfEhoAoGPyFCUG0u	\N	\N	\N	0	\N	\N	\N	\N	\N	2018-10-24 02:25:27	\N	\N	0	\N	2018-10-24 02:25:27	2018-10-24 02:25:27.549837	2018-10-24 02:25:27.549837	二级供应商测试2用户	总经理	+8613666804680
636832871	zyg@gmail.com	$2a$11$dVaHVzmBsg1HFbhtZHBPseqFVrVjAKBQKngf0mfEhoAoGPyFCUG0u	\N	\N	\N	0	\N	\N	\N	\N	\N	2018-10-24 02:25:27	\N	\N	0	\N	2018-10-24 02:25:27	2018-10-24 02:25:27.549837	2018-10-24 02:25:27.549837	二级供应商测试3用户	经理	+8613689904680
1061118112	wangjiajie1218@hotmail.com	$2a$11$JuCwRmSChq6vkJZr9HAT8OoyXlazasqqzU3Ywkm0YD6dC0teabs4e	\N	\N	\N	0	\N	\N	\N	\N	yExwHPh7NeDnYNk3tWSE	\N	2018-10-24 09:04:06.00627	\N	0	\N	2018-10-24 09:04:06.010022	2018-10-24 09:04:06.006145	2018-10-24 09:04:06.010383	王佳捷	销售经理	18116335505
1061118121	752799629@qq.com	$2a$11$uv0e1gOVyUk4.vpTIlDsIuQjnYyIVBCj3pM1EUZNKm3Eu6s9Z54NW	\N	\N	\N	0	\N	\N	\N	\N	NX3p1P2BvczFXwsUM9ia	\N	2018-10-25 06:34:03.735988	\N	0	\N	2018-10-25 06:34:03.739891	2018-10-25 06:34:03.735891	2018-10-25 06:34:03.740342	赵威	销售经理	18511192308
1061118139	djrh85272064@sina.com	$2a$11$EkL2autRhI7FTy2C3y7poeY70d9mGBdw3wtaD9PMrFVYukI21j7Ve	\N	\N	\N	4	2018-11-05 02:19:55.367104	2018-11-01 02:56:27.490512	222.210.170.69	222.210.170.69	MHzbDvyoHX64sgxVN-4x	2018-10-25 08:19:29.936173	2018-10-25 08:17:43.382689	\N	0	\N	\N	2018-10-25 08:17:43.382569	2018-11-05 02:19:55.368036	佘林	总经理	18980818585
1061118111	tj@teamjetmusic.com	$2a$11$9wZsCS3pPeJCyJ4u5wpi4e2lNwn2kFLzwAzYthFwolSO2aUPsqRGu	\N	\N	2018-10-24 09:03:01.368741	2	2018-10-24 09:17:45.426344	2018-10-24 09:03:01.373066	58.246.122.246	58.246.122.246	j9-RFxsenk-yhp2TozZ3	2018-10-24 09:02:54.434499	2018-10-24 08:56:08.368	\N	0	\N	\N	2018-10-24 08:56:08.367883	2018-10-24 09:17:45.42718	田军	总经理	13801932382
1061118144	26977347@qq.com	$2a$11$mJGFePG5.sbq7rGN0KiMOOjwKejFTJBY6lhcNUdcDAdY8v0HY8fje	\N	\N	\N	0	\N	\N	\N	\N	dJEbnqtSgUPN_ELLnCw4	\N	2018-10-26 07:16:20.374295	\N	0	\N	2018-10-26 07:16:20.377645	2018-10-26 07:16:20.37418	2018-10-26 07:16:20.378014	赵畅	技术支持	13951729578
1061118113	stanley@china-rs.com	$2a$11$U9CrOtNuqLHxzZ6mC29AZ.TzyGtFfTeZ18ivfuKefryFiKs/ZTn82	\N	\N	\N	1	2018-10-24 09:25:07.509536	2018-10-24 09:25:07.509536	113.98.118.147	113.98.118.147	zEzfoUt2FJq_oQHAziUm	2018-10-24 09:22:19.858508	2018-10-24 09:14:15.507793	\N	0	\N	\N	2018-10-24 09:14:15.507697	2018-10-24 09:25:07.510383	邱庆庆	业务总经理	13922259660
1061118110	landmarkint@163.com	$2a$11$BKvzAv0RaeMxU2RcOaCldeM2FIqOrrKNVtsNlJjGbhb5METXcBh2W	\N	\N	\N	5	2018-11-05 04:01:17.923768	2018-11-01 02:16:34.693629	163.177.136.189	163.177.139.121	2_HMzu8PyYjJxUL5wxGy	2018-10-24 08:52:29.601878	2018-10-24 08:44:44.95793	\N	0	\N	\N	2018-10-24 08:44:44.95776	2018-11-05 04:01:17.924687	陈卓琪	经理	020-84425158
731953277	yun.ji@harman.com	$2a$11$UxIIwoogCZOFYGZSI9O3RulKC6uKrAIhmYiG/txoWSxX9FJjzk/EO	\N	\N	\N	19	2018-11-01 04:44:41.464619	2018-11-01 01:09:37.925246	223.104.2.144	223.104.212.52	\N	2018-10-24 02:25:27	\N	\N	0	\N	\N	2018-10-24 02:25:27.549837	2018-11-01 04:44:41.465535	Yun Ji	AKG/MI Admin	+
1061118115	27489723@qq.com	$2a$11$Qbxm7WX9ryI0Ssnsl8LqqejYJBUZ/bnZE81R8JgK76L5nvBKTbBfC	\N	\N	\N	0	\N	\N	\N	\N	9z2rqDAn277W4FPMxD4w	\N	2018-10-24 09:30:49.503088	\N	0	\N	2018-10-24 09:30:49.506397	2018-10-24 09:30:49.502978	2018-10-24 09:30:49.506722	胡嘉豪	经理	020-84425158
1061118116	349960239@qq.com	$2a$11$cewgqrVNxOy.6hZZOtDMseUkuzGVmcfvZgaTpwyobC3ag4G1imhYm	\N	\N	\N	0	\N	\N	\N	\N	qRcz4gfyGhBNoN1J63V6	\N	2018-10-24 09:31:43.052728	\N	0	\N	2018-10-24 09:31:43.055959	2018-10-24 09:31:43.052598	2018-10-24 09:31:43.056319	黄子坚	经理	020-84425158
1061118142	gpwang_2002@163.com	$2a$11$ZT9ZvBluzfRMLBw9jWevqer/I1afEryIrYsCLAwS1bFWQM0K3CXGu	\N	\N	\N	2	2018-11-07 06:15:50.894853	2018-10-26 07:13:42.375258	58.212.26.197	49.65.222.100	GACK2MZxuRQHK2VkdzR8	2018-10-26 07:08:31.783494	2018-10-26 07:04:55.458052	\N	0	\N	\N	2018-10-26 07:04:55.457944	2018-11-07 06:15:50.895992	王国平	经理	13815874337
494500638	tim.bao@harman.com	$2a$11$dVaHVzmBsg1HFbhtZHBPseqFVrVjAKBQKngf0mfEhoAoGPyFCUG0u	\N	\N	\N	6	2018-10-31 01:23:49.551194	2018-10-26 07:14:21.831816	185.116.235.10	101.230.7.202	\N	2018-10-24 02:25:27	\N	\N	0	\N	\N	2018-10-24 02:25:27.549837	2018-10-31 01:23:49.552091	Tim Bao	JBL entertainment Admin	+
946014013	yao.yu@harman.com	$2a$11$PKWIYFZTi.vLEi5pfkX4ZuudtG9yjUi85esvegJI5/8zDJVJSqb7e	\N	\N	2018-10-24 13:25:06.631281	13	2018-11-05 15:17:36.098916	2018-10-30 12:39:42.598319	114.245.167.206	114.245.173.101	\N	2018-10-24 02:25:27	\N	\N	0	\N	\N	2018-10-24 02:25:27.549837	2018-11-05 15:17:36.100415	Yao Yu	AMX Admin	+
1061118147	gaojun@aixinmusic.com	$2a$11$eU2hqbIh/DyXeywp7zbP4e0za7eBi2rAW31Fgjg.d4aRiaXUuMVYi	\N	\N	\N	1	2018-10-27 11:39:47.709652	2018-10-27 11:39:47.709652	111.196.208.235	111.196.208.235	j1JpohbTVwbWFWyUU4ru	2018-10-26 12:22:59.876028	2018-10-26 11:34:51.896476	\N	0	\N	\N	2018-10-26 11:34:51.896319	2018-10-27 11:39:47.710506	高爱军	经理	010 82697849
1061118117	huachensj@foxmail.com	$2a$11$wyqQ/eoCGMqKyLxMcFBQQOYXedHtsGIDdjurNnNZxWPKbUqEyFKU2	\N	\N	\N	1	2018-10-25 04:09:55.946639	2018-10-25 04:09:55.946639	124.64.227.60	124.64.227.60	6T4fsKu8sxY2-1zsyhAT	2018-10-25 03:43:45.849458	2018-10-25 03:42:38.521245	\N	0	\N	\N	2018-10-25 03:42:38.521106	2018-10-25 04:09:55.947852	董迁	总经理	13910335950
1061118123	1552974415@qq.com	$2a$11$sg3LpdRmqxcxuzxVuzSKTuQ.Xz2.cUEitalqWhyVHrKCliJq6BS5.	\N	\N	\N	0	\N	\N	\N	\N	ReSaamwTV-eoc_vm1xdE	\N	2018-10-25 06:35:40.824141	\N	0	\N	2018-10-25 06:35:40.827155	2018-10-25 06:35:40.824039	2018-10-25 06:35:40.827528	伊辉	销售经理	18510236221
441287711	johnson.yang@harman.com	$2a$11$Ip6EUwCSP/bjy2Vbbpr2YOtmzp7VuqieMG72NlKpuP.oNlcNii12m	\N	\N	2018-10-31 01:33:30.044052	27	2018-11-06 05:03:44.052011	2018-11-05 01:22:46.146338	183.134.52.45	180.156.235.28	\N	2018-10-24 02:25:27	\N	\N	0	\N	\N	2018-10-24 02:25:27.549837	2018-11-06 05:03:44.052699	Johnson Yang	Harman Admin	+
1061118109	xueqin.zhang@harman.com	$2a$11$dVaHVzmBsg1HFbhtZHBPseqFVrVjAKBQKngf0mfEhoAoGPyFCUG0u	\N	\N	\N	0	\N	\N	\N	\N	\N	2018-10-24 02:25:27	\N	\N	2	\N	\N	2018-10-24 02:25:27.549837	2018-10-25 05:09:46.426784	Xueqin Zhang	Marting lighting Admin	+
1061118120	2163508753@qq.com	$2a$11$vWL1fmUM0tSva7NUvdJ1J.rCoQuj8Nf/8SP7UITtCWGIdRZSqwwaq	\N	\N	\N	0	\N	\N	\N	\N	s3y5y2ok7KCQQFdxkXrf	\N	2018-10-25 06:30:55.670608	\N	0	\N	2018-10-25 06:30:55.674322	2018-10-25 06:30:55.670501	2018-10-25 06:30:55.67467	张璞	销售经理	18510236556
1061118145	675234669@qq.com	$2a$11$15w8G/u3x2MUDSI147OdBewbGf1Q5YXoe1KIuY0RW5vnGOaxjFozu	\N	\N	\N	0	\N	\N	\N	\N	rVWs3RUxT_jEb9gCbiZp	\N	2018-10-26 07:17:44.759161	\N	0	\N	2018-10-26 07:17:44.762497	2018-10-26 07:17:44.759055	2018-10-26 07:17:44.762845	徐莉	经理	13951751751
822325298	leo.yan@harman.com	$2a$11$dVaHVzmBsg1HFbhtZHBPseqFVrVjAKBQKngf0mfEhoAoGPyFCUG0u	\N	\N	\N	3	2018-10-29 14:14:14.502869	2018-10-29 08:10:30.843135	101.87.17.14	108.171.131.169	\N	2018-10-24 02:25:27	\N	\N	0	\N	\N	2018-10-24 02:25:27.549837	2018-10-29 14:14:14.503757	Leo Yan	Install sound Admin	+
1061118125	verdure-audio@163.com	$2a$11$G8iGm5IacM0l4EjGk4Y7/em/k1LJD0QoLZpmiw93h/BEhG1LwufLq	\N	\N	\N	1	2018-10-26 07:28:01.970329	2018-10-26 07:28:01.970329	163.177.136.228	163.177.136.228	-vAr1Gw7mWxhsabF2tmz	2018-10-26 03:18:21.389252	2018-10-25 07:21:54.091278	\N	0	\N	\N	2018-10-25 07:21:54.091156	2018-10-26 07:28:01.971155	蓝金洪	主管	020-83879313
1061118143	liyanli20090301@126.com	$2a$11$epj6pQCpCAeFMIVrfxVXquotuylFkj22H564s6fo/EZZvuuHAfaxy	\N	\N	\N	0	\N	\N	\N	\N	TxajQoMoz8kwgM9aftsn	2018-10-26 07:14:49.989616	2018-10-26 07:11:50.101621	\N	0	\N	\N	2018-10-26 07:11:50.10152	2018-10-26 07:14:49.990206	李艳丽	采购	029-82240609
1061118146	nieshijing@honghe-tech.com	$2a$11$f22rouMz.tU8/0xhJ74.j.SwLuRB29Y1zh4QZpUpeHgzzHaxymzN2	\N	\N	\N	0	\N	\N	\N	\N	zjx2XBVjUZcEFf8TT9zJ	2018-10-26 15:09:29.352086	2018-10-26 09:39:51.587379	\N	0	\N	\N	2018-10-26 09:39:51.587274	2018-10-26 15:09:29.35307	聂世静	商务	15910428037
1061118150	wenzongyuan@aixinmusic.com	$2a$11$mk7ZLM.bjG6b3et5bPRHnOTquLqKZqx.doYRJAXx7oAnXCMiP6oxK	\N	\N	\N	0	\N	\N	\N	\N	snaytU7WWxuGpRxHZwTC	\N	2018-10-27 11:42:50.957902	\N	0	\N	2018-10-27 11:42:50.96164	2018-10-27 11:42:50.957703	2018-10-27 11:42:50.961983	温宗元	AKG产品经理	13331029708
1061118151	zhaotiandi@aixinmusic.com	$2a$11$HWgBN9Jr5NIMhXl2Pb/hBuxNPDPxRp7fynt3XkK7yBk6UHdJO40Xy	\N	\N	\N	0	\N	\N	\N	\N	sWpM71xjBGTxCrwQpwgX	\N	2018-10-27 11:46:54.194609	\N	0	\N	2018-10-27 11:46:54.19792	2018-10-27 11:46:54.194508	2018-10-27 11:46:54.198287	赵田地	技术工程师	15901089382
1061118152	huzhengwei@aixinmusic.com	$2a$11$ADnN8jVmz.AiqFGnzo30pO67J4tcvM9j72VxD7HfOGldVxbPpWLRS	\N	\N	\N	0	\N	\N	\N	\N	RGVeoxqnrzzvW6Ukgxy6	\N	2018-10-27 11:48:52.408076	\N	0	\N	2018-10-27 11:48:52.411201	2018-10-27 11:48:52.407966	2018-10-27 11:48:52.41158	胡正伟	技术	13357274466
1061118149	yaojiage@nanpeng-tech.com	$2a$11$RA71rKNreo34bumXdljeLucOVtj7A82ORbymml5MWWhI6aK2EHAWe	\N	\N	\N	1	2018-10-29 01:35:18.087676	2018-10-29 01:35:18.087676	221.216.86.190	221.216.86.190	WztgR7qGeeHASmpTsdzy	2018-10-26 15:09:48.462913	2018-10-26 12:21:27.653565	\N	0	\N	\N	2018-10-26 12:21:27.653467	2018-10-29 01:35:18.08855	姚佳哿	技术工程师	13811387987
1061118153	xingwei@aixinmusic.com	$2a$11$JXzdbOEE96NwGAGuZBc5xO1GDT6aiADKm6RyvSZ4vptUGwOyeuGeO	\N	\N	\N	0	\N	\N	\N	\N	AHUNt9PHBg1h6sFCFPwV	\N	2018-10-27 11:51:34.365553	\N	0	\N	2018-10-27 11:51:34.369355	2018-10-27 11:51:34.365427	2018-10-27 11:51:34.369827	邢伟	渠道销售	17343093837
1061118156	icecube_210@126.com	$2a$11$YzlMtUXGwDx/eH56xhupCO9faDX4FLGnhVdJOFnrDOWzSmD8ibd9C	\N	\N	\N	1	2018-10-31 07:14:06.372595	2018-10-31 07:14:06.372595	180.159.3.209	180.159.3.209	tFT1wMc6aw62-rnYsMvr	2018-10-29 14:14:42.184573	2018-10-29 09:32:55.549286	\N	0	\N	\N	2018-10-29 09:32:55.549154	2018-10-31 07:14:06.373497	杜勇威	销售	13764313577
1061118182	461766233@qq.com	$2a$11$DswK7aLlWupHo73rX7SM5.pTHluHpz.Zl4QLz/IN.NLTT699XNLMa	\N	\N	\N	0	\N	\N	\N	\N	B2vRq2VCBXhZm5jspDCf	\N	2018-10-31 07:24:52.970908	\N	0	\N	2018-10-31 07:24:52.975907	2018-10-31 07:24:52.970806	2018-10-31 07:24:52.976317	江天宸	销售	17317609899
1061118189	xfsound@foxmail.com		\N	\N	\N	0	\N	\N	\N	\N	zpgsCuo-a-21-XwpuQJS	2018-11-01 04:45:18.837809	2018-11-01 02:21:29.944834	\N	0	\N	\N	2018-11-01 02:21:29.944746	2018-11-01 04:45:18.838335	王宗飞	经理	13585994285
1061118190	2827370225@qq.com	$2a$11$Q5y85iY7FWIGXFLpwi3e1u80sUEV1cso3EzyJenpMAFz1sz2G793e	\N	\N	\N	0	\N	\N	\N	\N	AeJaU8KymHLLXYFqofuJ	\N	2018-11-01 04:54:47.941499	\N	0	\N	2018-11-01 04:54:47.945419	2018-11-01 04:54:47.94134	2018-11-01 04:54:47.945861	程晶晶	经理	020-84425158
1061118186	akgpro10000@163.com	$2a$11$wT4MVYHOGZK1XEmyeKyO/eAr1J7dyE2yRkaMUDFBiB9XHHL2937ae	\N	\N	2018-11-02 02:57:07.277615	2	2018-11-02 02:57:07.283214	2018-11-01 10:34:41.416307	125.77.88.59	125.77.88.59	mERSLBp6ZFHyuCVfy_GU	2018-11-01 04:45:12.419333	2018-11-01 01:11:12.291203	\N	0	\N	\N	2018-11-01 01:11:12.29107	2018-11-02 02:57:07.283738	陈雪萍	总经理	13609559543
1061118155	jiayunxsbb@163.com	$2a$11$i4a9U/WfEVmW93vDcyIRwOu247R.CiswB.6EH8ix5L1ezY7Qt98Bu	\N	\N	2018-10-30 01:29:10.767999	3	2018-10-31 02:01:22.48652	2018-10-30 03:59:42.426781	110.255.177.56	110.255.177.56	roQfYNpXRwssWWqiGPKd	2018-10-29 08:10:56.865886	2018-10-28 02:50:44.752428	\N	0	\N	\N	2018-10-28 02:50:44.752329	2018-10-31 02:01:22.487248	郑朕	销售经理	18230318811
1061118191	821263164@qq.com		\N	\N	\N	0	\N	\N	\N	\N	7hjvTQ54RwAr36RqJsxy	\N	2018-11-05 04:03:19.427212	\N	0	\N	2018-11-05 04:03:19.431019	2018-11-05 04:03:19.4271	2018-11-05 04:03:19.43138	张群	经理	17621158430
1061118192	36193689@qq.com		\N	\N	\N	0	\N	\N	\N	\N	m3cqYjUB-uxewkstsVhw	\N	2018-11-05 04:50:58.804613	\N	0	\N	2018-11-05 04:50:58.808602	2018-11-05 04:50:58.804505	2018-11-05 04:50:58.808992	张群	经理	17621158430
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('users_id_seq', 1061118195, true);


--
-- Data for Name: vertical_market_circulars; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vertical_market_circulars (id, vertical_market_id, circular_id, created_at, updated_at) FROM stdin;
139049406	967069987	551060560	2018-10-24 02:25:27.564312	2018-10-24 02:25:27.564312
409524414	472756237	551060560	2018-10-24 02:25:27.564312	2018-10-24 02:25:27.564312
409524415	967069987	551060561	2018-10-24 02:51:07.133308	2018-10-24 02:51:07.133308
409524416	472756237	551060561	2018-10-24 02:51:07.135461	2018-10-24 02:51:07.135461
409524417	953783521	551060561	2018-10-24 02:51:07.136628	2018-10-24 02:51:07.136628
409524418	581169617	551060561	2018-10-24 02:51:07.137716	2018-10-24 02:51:07.137716
409524419	304614323	551060561	2018-10-24 02:51:07.138804	2018-10-24 02:51:07.138804
409524420	967069987	551060562	2018-10-25 01:59:08.606852	2018-10-25 01:59:08.606852
409524421	472756237	551060562	2018-10-25 01:59:08.60837	2018-10-25 01:59:08.60837
409524422	953783521	551060562	2018-10-25 01:59:08.611283	2018-10-25 01:59:08.611283
409524423	581169617	551060562	2018-10-25 01:59:08.612334	2018-10-25 01:59:08.612334
409524424	304614323	551060562	2018-10-25 01:59:08.613398	2018-10-25 01:59:08.613398
409524425	967069987	551060563	2018-10-30 02:08:22.846771	2018-10-30 02:08:22.846771
409524426	967069987	551060564	2018-10-31 07:12:49.111894	2018-10-31 07:12:49.111894
409524427	472756237	551060564	2018-10-31 07:12:49.113497	2018-10-31 07:12:49.113497
409524428	953783521	551060564	2018-10-31 07:12:49.116879	2018-10-31 07:12:49.116879
409524429	581169617	551060564	2018-10-31 07:12:49.11792	2018-10-31 07:12:49.11792
409524430	304614323	551060564	2018-10-31 07:12:49.118883	2018-10-31 07:12:49.118883
\.


--
-- Name: vertical_market_circulars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('vertical_market_circulars_id_seq', 409524430, true);


--
-- Data for Name: vertical_market_companies; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vertical_market_companies (id, vertical_market_id, company_id, created_at, updated_at, approved_at) FROM stdin;
79228794	967069987	652367030	2018-10-24 02:25:27.59076	2018-10-24 02:25:27.59076	\N
908158196	472756237	652367030	2018-10-24 02:25:27.59076	2018-10-24 02:25:27.59076	\N
757523704	967069987	81938313	2018-10-24 02:25:27.59076	2018-10-24 02:25:27.59076	\N
917240223	953783521	81938313	2018-10-24 02:25:27.59076	2018-10-24 02:25:27.59076	\N
816798727	967069987	240803873	2018-10-24 02:25:27.59076	2018-10-24 02:25:27.59076	\N
738063991	953783521	240803873	2018-10-24 02:25:27.59076	2018-10-24 02:25:27.59076	\N
230546992	967069987	561159139	2018-10-24 02:25:27.59076	2018-10-24 02:25:27.59076	\N
917240224	967069987	652367031	2018-10-24 08:44:45.814061	2018-10-24 08:52:29.607015	2018-10-24
917240226	967069987	652367032	2018-10-24 08:56:09.143759	2018-10-24 09:02:54.442393	2018-10-24
917240227	967069987	652367033	2018-10-24 09:14:16.502112	2018-10-24 09:22:19.864047	2018-10-24
917240228	967069987	652367034	2018-10-25 03:42:39.350489	2018-10-25 03:43:45.85782	2018-10-25
917240225	304614323	652367031	2018-10-24 08:44:45.836224	2018-10-25 06:06:49.439063	2018-10-25
917240239	967069987	652367040	2018-10-25 08:17:44.223242	2018-10-25 08:19:29.941113	2018-10-25
917240237	304614323	652367038	2018-10-25 07:21:54.921583	2018-10-26 03:18:21.401542	2018-10-26
917240243	967069987	652367042	2018-10-26 07:04:56.259569	2018-10-26 07:08:31.789872	2018-10-26
917240244	304614323	652367043	2018-10-26 07:11:50.88983	2018-10-26 07:14:49.994902	2018-10-26
917240246	967069987	652367045	2018-10-26 11:34:52.889988	2018-10-26 12:22:59.881461	2018-10-26
917240245	953783521	652367044	2018-10-26 09:39:52.36675	2018-10-26 15:09:29.360008	2018-10-26
917240247	953783521	652367046	2018-10-26 12:21:28.435786	2018-10-26 15:09:48.46803	2018-10-26
917240248	472756237	652367047	2018-10-28 02:50:45.76734	2018-10-29 08:10:56.872349	2018-10-29
917240240	472756237	652367040	2018-10-25 08:17:44.231957	2018-10-29 08:15:28.466532	2018-10-29
917240229	472756237	652367034	2018-10-25 03:42:39.360745	2018-10-29 08:15:29.673081	2018-10-29
917240249	472756237	652367048	2018-10-29 09:32:56.384668	2018-10-29 14:14:42.190172	2018-10-29
917240268	472756237	652367054	2018-11-01 01:11:13.101725	2018-11-01 01:11:13.101725	\N
917240267	967069987	652367054	2018-11-01 01:11:13.093634	2018-11-01 04:45:12.424686	2018-11-01
917240269	967069987	652367055	2018-11-01 02:21:29.96162	2018-11-01 04:45:18.847306	2018-11-01
917240270	967069987	652367048	2018-11-05 04:03:19.441707	2018-11-05 04:03:19.441707	\N
\.


--
-- Name: vertical_market_companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('vertical_market_companies_id_seq', 917240270, true);


--
-- Data for Name: vertical_market_courses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vertical_market_courses (id, vertical_market_id, course_id, created_at, updated_at) FROM stdin;
1045558313	967069987	56320775	2018-10-24 02:25:27.568161	2018-10-24 02:25:27.568161
655197510	472756237	56320775	2018-10-24 02:25:27.568161	2018-10-24 02:25:27.568161
882132235	967069987	85574194	2018-10-24 02:25:27.568161	2018-10-24 02:25:27.568161
343501477	472756237	85574194	2018-10-24 02:25:27.568161	2018-10-24 02:25:27.568161
182819552	304614323	85574194	2018-10-24 02:25:27.568161	2018-10-24 02:25:27.568161
175791660	967069987	1007196941	2018-10-24 02:25:27.568161	2018-10-24 02:25:27.568161
287896666	953783521	1007196941	2018-10-24 02:25:27.568161	2018-10-24 02:25:27.568161
524579456	967069987	506801965	2018-10-24 02:25:27.568161	2018-10-24 02:25:27.568161
1045558314	967069987	1007196942	2018-10-31 07:04:39.478526	2018-10-31 07:04:39.478526
\.


--
-- Name: vertical_market_courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('vertical_market_courses_id_seq', 1045558314, true);


--
-- Data for Name: vertical_markets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vertical_markets (id, name, admin_id, created_at, updated_at) FROM stdin;
967069987	AKG/MI	731953277	2018-10-24 02:25:27.575556	2018-10-24 02:25:27.575556
472756237	Install Sound	822325298	2018-10-24 02:25:27.575556	2018-10-24 02:25:27.575556
953783521	AMX	946014013	2018-10-24 02:25:27.575556	2018-10-24 02:25:27.575556
581169617	Martin Lighting	1061118109	2018-10-24 02:25:27.575556	2018-10-24 02:25:27.575556
304614323	JBL Entertainment	494500638	2018-10-24 02:25:27.575556	2018-10-24 02:25:27.575556
\.


--
-- Name: vertical_markets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('vertical_markets_id_seq', 967069987, true);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: circulars_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY circulars
    ADD CONSTRAINT circulars_pkey PRIMARY KEY (id);


--
-- Name: companies_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: company_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY company_users
    ADD CONSTRAINT company_users_pkey PRIMARY KEY (id);


--
-- Name: course_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY course_users
    ADD CONSTRAINT course_users_pkey PRIMARY KEY (id);


--
-- Name: courses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: vertical_market_circulars_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY vertical_market_circulars
    ADD CONSTRAINT vertical_market_circulars_pkey PRIMARY KEY (id);


--
-- Name: vertical_market_companies_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY vertical_market_companies
    ADD CONSTRAINT vertical_market_companies_pkey PRIMARY KEY (id);


--
-- Name: vertical_market_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY vertical_market_courses
    ADD CONSTRAINT vertical_market_courses_pkey PRIMARY KEY (id);


--
-- Name: vertical_markets_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY vertical_markets
    ADD CONSTRAINT vertical_markets_pkey PRIMARY KEY (id);


--
-- Name: index_companies_on_managed_by_company_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_companies_on_managed_by_company_id ON companies USING btree (managed_by_company_id);


--
-- Name: index_companies_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_companies_on_name ON companies USING btree (name);


--
-- Name: index_company_users_on_company_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_company_users_on_company_id ON company_users USING btree (company_id);


--
-- Name: index_company_users_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_company_users_on_user_id ON company_users USING btree (user_id);


--
-- Name: index_course_users_on_course_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_course_users_on_course_id ON course_users USING btree (course_id);


--
-- Name: index_course_users_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_course_users_on_user_id ON course_users USING btree (user_id);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON users USING btree (confirmation_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_users_on_unlock_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_unlock_token ON users USING btree (unlock_token);


--
-- Name: index_vertical_market_circulars_on_circular_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_vertical_market_circulars_on_circular_id ON vertical_market_circulars USING btree (circular_id);


--
-- Name: index_vertical_market_circulars_on_vertical_market_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_vertical_market_circulars_on_vertical_market_id ON vertical_market_circulars USING btree (vertical_market_id);


--
-- Name: index_vertical_market_companies_on_company_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_vertical_market_companies_on_company_id ON vertical_market_companies USING btree (company_id);


--
-- Name: index_vertical_market_companies_on_vertical_market_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_vertical_market_companies_on_vertical_market_id ON vertical_market_companies USING btree (vertical_market_id);


--
-- Name: index_vertical_market_courses_on_course_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_vertical_market_courses_on_course_id ON vertical_market_courses USING btree (course_id);


--
-- Name: index_vertical_market_courses_on_vertical_market_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_vertical_market_courses_on_vertical_market_id ON vertical_market_courses USING btree (vertical_market_id);


--
-- Name: index_vertical_markets_on_admin_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_vertical_markets_on_admin_id ON vertical_markets USING btree (admin_id);


--
-- PostgreSQL database dump complete
--

