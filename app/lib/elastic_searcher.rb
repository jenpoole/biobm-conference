class ElasticSearcher
    
    attr_reader :events

    def call(params)
        @params = params
        
        @events = if params[:search] && ( params[:search][:location].present? || params[:search][:starts_at_start].present? || params[:search][:starts_at_end].present? )
            advanced_search
        else
            simple_search
        end
        
        self
    end    
    
    
    protected
    
    attr_reader :params
    

    # Keyword Search
    def simple_search
        Event.search(params[:q]).page(params[:page] || 1).per(15).records
    end
    
    # Advanced Search: Location
    def advanced_search
        location = params[:search][:location]
            
        matches = []
        matches << { wildcard: { location: location } } unless location.empty?
                
        Event.search({
            query: {
                bool: {
                    must: [ matches, starts_at_range ].flatten
                }
            }
        }).page(params[:page] || 1).per(15).records
    end
    
    # Date Range Search
    def starts_at_range
        starts_at_start = params[:search][:starts_at_start]
        starts_at_end   = params[:search][:starts_at_end]
    
        starts_at_start = nil if starts_at_start.empty?
        starts_at_end   = nil if starts_at_end.empty?
    
        {
          range: {
            starts_at: {
              gte: starts_at_start,
              lte: starts_at_end,
              format: "MM/dd/yyyy"
            }
          }
        }
    end
    
end