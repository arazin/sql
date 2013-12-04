alter table events add (created datetime NOT NULL,modified datetime NOT NULL);
alter table graduates add (lasteventview datetime default NULL);
alter table students add (created datetime NOT NULL,modified datetime NOT NULL);
alter table graduates add (created datetime NOT NULL,modified datetime NOT NULL);
alter table participants add (created datetime NOT NULL,modified datetime NOT NULL);




