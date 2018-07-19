class AddPaperclipToPhotos < ActiveRecord::Migration[5.1]
  def self.up
    add_attachment :photo, :image
  end

  def self.down
    remove_attachment :photo, :image
  end
end
