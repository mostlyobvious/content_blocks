require 'active_record'
require 'aasm'
require 'RedCloth'

module ContentBlocks
  module Models
    class Snippet < ActiveRecord::Base
      include AASM
    
      set_table_name 'content_blocks_snippets'
      
      LABEL_FORMAT = /^[a-zA-Z\d_]+$/

      aasm_initial_state :draft
      aasm_column :status

      aasm_state :draft
      aasm_state :published

      aasm_event :preview do
        transitions :from => :published, :to => :draft
      end

      aasm_event :publish do
        transitions :from => :draft, :to => :published
      end

      scope :published, where(:status => 'published')
      scope :draft, where(:status => 'draft')

      validates :label, 
        :presence => true, 
        :format => { :with => LABEL_FORMAT }, 
        :uniqueness => { :scope => :status, :if => :published? }

      def self.[](label)
        find_or_create_by_label(label)
      end

      def content
        textilize(raw_content)
      end

      def raw_content
        self[:content] if published?
      end   
    end
  end
end
