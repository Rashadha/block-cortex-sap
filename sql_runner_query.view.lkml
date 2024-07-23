
view: sql_runner_query {
  derived_table: {
    sql: SELECT
        TaxJurisdiction_TXJCD,
        SUM(TaxAmount_MWSBK) AS total_tax_amount,
        SUM(TaxAmountPos_MWSBP) AS total_tax_amount_pos
      FROM `lankatiles-cortex.CORTEX_SAP_REPORTING.Billing`
      GROUP BY
        TaxJurisdiction_TXJCD ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: tax_jurisdiction_txjcd {
    type: string
    sql: ${TABLE}.TaxJurisdiction_TXJCD ;;
  }

  dimension: total_tax_amount {
    type: number
    sql: ${TABLE}.total_tax_amount ;;
  }

  dimension: total_tax_amount_pos {
    type: number
    sql: ${TABLE}.total_tax_amount_pos ;;
  }

  set: detail {
    fields: [
        tax_jurisdiction_txjcd,
	total_tax_amount,
	total_tax_amount_pos
    ]
  }
}
