--
-- Class Todo as table todos
--


CREATE TABLE "todos" (
  "id" serial,
  "kategori" text NOT NULL,
  "judul" text NOT NULL,
  "keterangan" text NOT NULL
);

ALTER TABLE ONLY "todos"
  ADD CONSTRAINT todos_pkey PRIMARY KEY (id);


