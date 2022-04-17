# frozen_string_literal: true

module Connections
  # This class paginate relations that have sequential "id" field
  #
  # Note: it assumes your relation query is ordered by id.
  # Note 2: has_previous and has_next will only return meaningful
  #  booleans when you use last+after or first+before.
  class SequentialIdConnection < GraphQL::Pagination::ActiveRecordRelationConnection
    def has_next_page
      @has_next_page || false
    end

    def has_previous_page
      @has_previous_page || false
    end

    def cursor_for(item)
      encode(item.to_global_id.to_s.sub("gid://#{GlobalID.app}/", ''))
    end

    private

    def id_from_cursor(cursor)
      decode(cursor)
        .split('/', 2)
        .second
        .to_i
    end

    def limited_nodes
      @sliced_nodes ||= begin
        paginated_nodes = items

        if after
          after_id = id_from_cursor(after)

          paginated_nodes = paginated_nodes.where('id > ?', after_id)
        end

        if before
          before_id = id_from_cursor(before)

          paginated_nodes = paginated_nodes.where('id < ?', before_id)
        end

        if first
          @has_next_page = paginated_nodes.count > first

          paginated_nodes = set_limit(paginated_nodes, first)
        end

        if last
          offset = paginated_nodes.count - last

          @has_previous_page = offset.positive?

          paginated_nodes = set_offset(paginated_nodes, offset)
        end

        paginated_nodes
      end
    end
  end
end
