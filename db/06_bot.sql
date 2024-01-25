DROP TABLE IF EXISTS bookmarks CASCADE;
DROP TYPE IF EXISTS bookmark_kind CASCADE;
DROP TABLE IF EXISTS showcase_records CASCADE;
DROP TABLE IF EXISTS index_packages CASCADE;
DROP TABLE IF EXISTS bookmarks CASCADE;


CREATE TYPE bookmark_kind AS ENUM ('discuss', 'q&a', 'snippet');

CREATE TABLE bot_bookmarks (
  id SERIAL PRIMARY KEY,
  userId BIGINT,
  messageAuthorId BIGINT,
  channelId BIGINT,
  messageId BIGINT,
  content TEXT,
  kind bookmark_kind,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  UNIQUE(userId, messageId)
);

CREATE TABLE bot_showcase_records (
  id SERIAL PRIMARY KEY,
  userId BIGINT,
  channelId BIGINT,
  messageId BIGINT,
  content TEXT,
  kind VARCHAR(255),
  link TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  UNIQUE(userId, link)
);

CREATE TABLE bot_indexed_packages (
  id SERIAL PRIMARY KEY,
  userId BIGINT,
  link TEXT,
  description TEXT,
  keywords VARCHAR[],
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  UNIQUE(link)
);
