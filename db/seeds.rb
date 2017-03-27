# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Quiz.destroy_all
array=["float: left", "웹서비스", "프레임워크", "컴퓨터 프로그래밍 언어",
          "마크업 언어", "프론트엔드", "백엔드", "ruby(보석 말고)", "rails" ]
@id=1
array.each do |x|
    Quiz.create!({id: @id, content: x})
    @id+=1
end