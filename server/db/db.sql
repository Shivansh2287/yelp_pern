create table restaurants (
    id bigserial not null primary key,
    name varchar(50) not null,
    location varchar(50) not null,
    price_range int not null check(price_range>=1 and price_range<=5)
);

insert into restaurants (name,location,price_range) values ('pizza','vns',3);

alter table restraunt add column location varchar(50);



CREATE TABLE reviews (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    restaurant_id BIGINT NOT NULL REFERENCES restaurants(id),
    name VARCHAR(50) NOT NULL,
    review TEXT NOT NULL,
    rating INT NOT NULL check(
        rating >= 1
        and rating <= 5
    )
);
select *
from restaurants
    left join(
        select restaurant_id,
            count(*),
            TRUNC(AVG(rating, 1)) as average_rating
        from reviews
        group by restaurant_id
    ) reviews on restaurants.id = reviews.restaurant_id;