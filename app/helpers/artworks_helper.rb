module ArtworksHelper
  def medium_list_or_none(artwork)
    if artwork.medium_list.any?
      artwork.medium_list.to_s
    else
      'unknown'
    end
  end

  def price_or_not_applicable(artwork)
    artwork.price.present? ? number_to_currency(artwork.price) : 'n/a'
  end
end
