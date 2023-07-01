# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'John', photo: 'https://otkritkis.com/wp-content/uploads/2021/12/original-5-4.jpg', bio: 'Passionate about science and technology.')
second_user = User.create(name: 'Emily', photo: 'https://cdn140.picsart.com/268677411009201.png', bio: 'Interested in history and art.')
third_user = User.create(name: 'Sophia', photo: 'https://yt3.ggpht.com/ytc/AKedOLTQyz4Tycr1goerUWaMMCU3NNlvEAUlx4EzKF9Qww=s900-c-k-c0x00ffffff-no-rj', bio: 'Specializing in literature.')
fourth_user = User.create(name: 'David', photo: 'https://www.gkristianhansenorthodontics.com/wp-content/uploads/2018/07/Healthy_Bite_Bozeman_MT_Orthodontist.jpg', bio: 'Teacher from Poland.')


first_post = Post.create(author_id: first_user.id, title: 'Introduction', text: 'Hello, everyone! This is my first post. I am excited to join this community.')
third_post = Post.create(author_id: first_user.id, title: 'The Best of the Best', text: 'I believe that success comes to those who strive for excellence. It is a pleasure to share my insights with you all.')
fourth_post = Post.create(author_id: first_user.id, title: 'Unleashing the Power', text: 'Boldly defined, we have the potential to achieve great things. Let\'s unlock our true potential together.')
fifth_post = Post.create(author_id: first_user.id, title: 'Greetings', text: 'Nice to meet you all! I look forward to engaging in meaningful discussions and sharing ideas.')
second_post = Post.create(author_id: second_user.id, title: 'My Journey Continues', text: 'Welcome back, everyone! This is my second post. Thank you for your continued support.')
third_post = Post.create(author_id: second_user.id, title: 'Getting to Know You', text: 'Where are you from? I am curious to learn more about your backgrounds and experiences.')


first_comment = Comment.create(author_id: first_user.id, post_id: first_post.id, text: 'Hello Tom!' )
second_comment = Comment.create(author_id: second_user.id, post_id: second_post.id, text: 'Hello Jake')

first_like = Like.create(author_id: second_user.id, post_id: first_post.id)
second_like = Like.create(author_id: first_user.id, post_id: second_post.id)

