json.id post.id
json.title post.title
json.body post.body
json.created_at post.created_at
if user != nil
    json.author do
        json.id user["id"]
        json.name user['name']
        json.email user["email"]
    end
end

json.comments post.comments do |comment|
    json.id comment.id
    json.body comment.body
    json.created_at comment.created_at
    json.author do
        json.id user["id"]
        json.name user['name']
        json.email user["email"]
    end  
end