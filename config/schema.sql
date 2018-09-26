create table if not exists charts(
  id          char(24)      primary key,
  title       varchar(255)  not null,
  highcharts  text          not null,
  created_at  timestamp     default current_timestamp
);

