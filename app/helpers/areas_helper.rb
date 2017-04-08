module AreasHelper
  def index_view_output
    arr = ""
    id_hash = Country.create_query_hash(params)
    if id_hash[:a].present?
      area_name_arr = Area.find(id_hash[:a]).map(&:area_name)
      arr << "エリア: "
      arr << area_name_arr.join(", ") + "<br>"
    end
    if id_hash[:v].present?
      visa_type_arr = Visa.find(id_hash[:v]).map(&:visa_type)
      arr << "ビザ種別: "
      arr << visa_type_arr.join(", ") + "<br>"
    end
    sanitize(arr, :tags => %w(br))
  end
end
