alter table events add (created datetime,modified datetime );
alter table graduates add (lasteventview datetime default NULL);
alter table students add (created datetime,modified datetime );
alter table graduates add (created datetime,modified datetime );
alter table participants add (created datetime,modified datetime );




