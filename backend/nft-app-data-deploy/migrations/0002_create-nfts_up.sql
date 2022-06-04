 CREATE TABLE nfts (
    id SERIAL PRIMARY KEY,
    description varchar,
    imageUri varchar,
    creator integer not null
);

CREATE TABLE nftOwner (
  nft_id integer not null,
  user_id integer not null
);


CREATE TABLE nftPrices (
  nft_id integer not null,
  price bigint  
);

CREATE TABLE userBalances (
  user_id integer not null
  balance bigint
);