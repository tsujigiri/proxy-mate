# frozen_string_literal: true

require 'proxy_mate/version'
require 'prawn'
require 'prawn/measurement_extensions'

class ProxyMate # rubocop:disable Style/Documentation
  PAGE_SIZE = 'A4'
  PAGE_WIDTH = 210.mm
  PAGE_HEIGHT = 297.mm
  CARD_WIDTH = 63.5.mm
  CARD_HEIGHT = 88.9.mm
  X_GAP = (PAGE_WIDTH - 3 * CARD_WIDTH) / 4
  Y_GAP = (PAGE_HEIGHT - 3 * CARD_HEIGHT) / 4
  CARDS_PER_PAGE = 9

  def initialize(card_image_paths, file_name)
    @card_image_paths = card_image_paths
    @file_name = file_name
  end

  def generate
    Prawn::Document.generate(file_name, document_options) do |pdf|
      card_image_paths.each.with_index do |card_image_path, i|
        pdf.start_new_page if (i % CARDS_PER_PAGE).zero? && i.positive?
        add_card(pdf, card_image_path)
      end
    end
  end

  private

  attr_reader :card_image_paths, :file_name

  def document_options
    {
      margin: 0,
      print_scaling: :none,
      page_size: PAGE_SIZE
    }
  end

  def add_card(pdf, card_image_path)
    pdf.image(
      card_image_path,
      at: positions.next,
      width: CARD_WIDTH,
      height: CARD_HEIGHT
    )
  end

  def positions
    @positions ||= Enumerator.new do |out|
      n = 0
      loop do
        x = X_GAP + (n % 3) * (CARD_WIDTH + X_GAP)
        y = PAGE_HEIGHT - Y_GAP - (n / 3) * (CARD_HEIGHT + Y_GAP)
        out << [x, y]
        n += 1
        n = 0 if n == CARDS_PER_PAGE
      end
    end
  end
end
