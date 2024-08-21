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

CREATE TABLE public.django_admin_log (
	id serial4 NOT NULL,
	action_time timestamptz NOT NULL,
	object_id text NULL,
	object_repr varchar(200) NOT NULL,
	action_flag int2 NOT NULL,
	change_message text NOT NULL,
	content_type_id int4 NULL,
	user_id int8 NOT NULL,
	CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0)),
	CONSTRAINT django_admin_log_pkey PRIMARY KEY (id)
);
CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


-- public.django_admin_log foreign keys

ALTER TABLE public.django_admin_log ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE public.django_admin_log ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_user_administrationuser_id FOREIGN KEY (user_id) REFERENCES public.user_administrationuser(id) DEFERRABLE INITIALLY DEFERRED;