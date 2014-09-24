#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
Product.create!(title: 'AS Creation',
	description: %{<p>
		Единица             0.7х10 м.
		Коллекция           0.7х10 м.
		Страна              Германия
		Производитель       AS Creation
	</p>},
	image_url: 'http://oboilider.ru/d/456925/d/Brandywine__5249ae42a3a84__150x150_150.jpg',
	price: 1500.00,
	article: '93588-2')
Product.create!(title: 'Обои виниловые Erismann бежевые 1.06 м',
	description: %{<p>
		Виниловые обои на флизелиновой основе - это настенные покрытия в современном стиле, изготовленные из высококачественного и безопасного сырья по новейшим технологиям с использованием горячего тиснения. Настенные покрытия этой коллекции отличает богатство текстуры и цветовая гамма, состоящая из нежных благородных оттенков.
	</p>},
	image_url: 'http://images.obi.ru/fsicache/obi?type=image&source=ObiWebShop%2FPROD%2FRU%2Fproduct%2F274%2F274319_picture_1.jpg',
	price: 669.00,
	article: '2743193')
Product.create!(title: 'Обои виниловые Marburg белые 1.06 м',
	description: %{<p>
		Виниловые обои на флизелиновой основе - это настенные покрытия в современном стиле, изготовленные из высококачественного и безопасного сырья по новейшим технологиям с использованием горячего тиснения. Настенные покрытия этой коллекции отличает богатство текстуры и цветовая гамма, состоящая из нежных благородных оттенков.
	</p>},
	image_url: 'http://images.obi.ru/fsicache/obi?type=image&source=ObiWebShop%2FPROD%2FRU%2Fproduct%2F288%2F288016_picture_1.jpg',
	price: 1299.00,
	article: '2880169')