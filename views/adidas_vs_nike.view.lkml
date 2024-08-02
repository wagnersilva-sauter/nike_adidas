# The name of this view in Looker is "Adidas Vs Nike"
view: adidas_vs_nike {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `nike_adidas_dataset.adidas_vs_nike` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Brand" in Explore.

  dimension: brand {
    type: string
    sql: ${TABLE}.Brand ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.Description ;;
  }

  dimension: discount {
    type: number
    sql: ${TABLE}.Discount ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: last_visited {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Last_Visited ;;
  }

  dimension: listing_price {
    type: number
    sql: ${TABLE}.Listing_Price ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_listing_price {
    type: sum
    sql: ${listing_price} ;;  }
  measure: average_listing_price {
    type: average
    sql: ${listing_price} ;;  }

  dimension: product_id {
    type: string
    sql: ${TABLE}.Product_ID ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.Product_Name ;;
  }

  dimension: rating {
    type: number
    sql: ${TABLE}.Rating ;;
  }

  dimension: reviews {
    type: number
    sql: ${TABLE}.Reviews ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.Sale_Price ;;
  }
  measure: count {
    type: count
    drill_fields: [product_name]
  }
}
