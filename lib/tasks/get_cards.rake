namespace :cards do 
  desc "populate dominaria cards"
  task dominaria: :environment do 
    #get all dominaria cards
    MTG::Card.where(set: 'dom').all.each do |card|
      resource = Card.find_or_create_by(name: card.name)
      resource.description = card.text
      resource.image_url = card.image_url
      resource.set = card.set
      resource.save!
    end
  end
  desc "populate m19 cards"  
  task m19: :environment do 
    #get all core 2019 cards
    MTG::Card.where(set: 'M19').all.each do |card|
      resource = Card.find_or_create_by(name: card.name)
      resource.description = card.text
      resource.image_url = card.image_url
      resource.set = card.set
      resource.save!
    end
  end
end 
