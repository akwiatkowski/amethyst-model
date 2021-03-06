require "spec"
require "../src/mysql_adapter"
require "../src/sqlite_adapter"
include Amethyst::Model

class Post < Model
  adapter mysql
  sql_mapping({ 
    name: "VARCHAR(255)", 
    body: "TEXT" 
  })
end

class PostsByMonth < RoModel
  adapter mysql
  sql_mapping({ 
    month: "MONTHNAME(created_at)", 
    total: "COUNT(*)" 
  }, "posts")
end

class Comment < Model
  adapter sqlite 
  sql_mapping({ 
    name: "CHAR(255)", 
    body: "TEXT" 
  })
end

class User < Model
#  adapter postgresql
  adapter sqlite #TODO: change this back to postgres once its available
  sql_mapping({ 
    name: "TEXT", 
    pass: "TEXT" 
  })
end

Post.drop
Post.create

Comment.drop
Comment.create

User.drop
User.create
