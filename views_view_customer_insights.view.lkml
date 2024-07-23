
view: views_view_customer_insights {
  derived_table: {
    sql: SELECT
        CustomerGroup1_KVGR1,
        CustomerGroup2_KVGR2,
        CustomerGroup3_KVGR3,
        CustomerGroup4_KVGR4,
        CustomerGroup5_KVGR5,
        COUNT(DISTINCT BillingDocument_VBELN) AS total_documents,
        SUM(NetValue_NETWR) AS total_net_value,
        AVG(NetValue_NETWR) AS average_net_value
      FROM `lankatiles-cortex.CORTEX_SAP_REPORTING.Billing`
      GROUP BY
        CustomerGroup1_KVGR1,
        CustomerGroup2_KVGR2,
        CustomerGroup3_KVGR3,
        CustomerGroup4_KVGR4,
        CustomerGroup5_KVGR5 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: customer_group1_kvgr1 {
    type: string
    sql: ${TABLE}.CustomerGroup1_KVGR1 ;;
  }

  dimension: customer_group2_kvgr2 {
    type: string
    sql: ${TABLE}.CustomerGroup2_KVGR2 ;;
  }

  dimension: customer_group3_kvgr3 {
    type: string
    sql: ${TABLE}.CustomerGroup3_KVGR3 ;;
  }

  dimension: customer_group4_kvgr4 {
    type: string
    sql: ${TABLE}.CustomerGroup4_KVGR4 ;;
  }

  dimension: customer_group5_kvgr5 {
    type: string
    sql: ${TABLE}.CustomerGroup5_KVGR5 ;;
  }

  dimension: total_documents {
    type: number
    sql: ${TABLE}.total_documents ;;
  }

  dimension: total_net_value {
    type: number
    sql: ${TABLE}.total_net_value ;;
  }

  dimension: average_net_value {
    type: number
    sql: ${TABLE}.average_net_value ;;
  }

  set: detail {
    fields: [
        customer_group1_kvgr1,
	customer_group2_kvgr2,
	customer_group3_kvgr3,
	customer_group4_kvgr4,
	customer_group5_kvgr5,
	total_documents,
	total_net_value,
	average_net_value
    ]
  }
}
