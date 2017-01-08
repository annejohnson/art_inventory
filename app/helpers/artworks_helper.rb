module ArtworksHelper
  def medium_list_or_none(artwork)
    if artwork.medium_list.any?
      artwork.media.map do |medium|
        link_to(medium.name, medium_url(medium))
      end.join(', ').html_safe
    else
      'unknown'
    end
  end

  def price_or_not_applicable(artwork)
    artwork.price.present? ? number_to_currency(artwork.price) : 'n/a'
  end
end
