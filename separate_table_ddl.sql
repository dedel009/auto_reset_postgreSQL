-- public.core_apilog definition

-- Drop table

-- DROP TABLE public.core_apilog;

CREATE TABLE public.core_apilog (
	id bigserial NOT NULL,
	endpoint text NOT NULL,
	status_code int2 NOT NULL,
	http_method varchar(10) NULL,
	remote_address varchar(20) NULL,
	exec_time int4 NULL,
	"date" timestamptz NOT NULL,
	query_params jsonb NOT NULL,
	body_request jsonb NOT NULL,
	body_response jsonb NOT NULL,
	created timestamptz NOT NULL,
	updated timestamptz NOT NULL,
	request_meta jsonb NOT NULL,
	CONSTRAINT core_apilog_pkey PRIMARY KEY (id),
	CONSTRAINT core_apilog_status_code_check CHECK ((status_code >= 0))
);

CREATE TABLE public.core_freelog (
	id bigserial NOT NULL,
	log_type varchar(100) NULL,
	log_data jsonb NOT NULL,
	created timestamptz NOT NULL,
	updated timestamptz NOT NULL,
	CONSTRAINT core_freelog_pkey PRIMARY KEY (id)
);