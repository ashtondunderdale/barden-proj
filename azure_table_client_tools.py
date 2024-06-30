from azure.data.tables import TableServiceClient
from azure.core.exceptions import ResourceExistsError

import os
import sys
import pandas as pd

storage_account_conn_str = ''

def create_table_or_get_if_exists(table_name, connection_string=storage_account_conn_str):

    """Creates Azure Storage Table or retrieves if it already exists."""

    table_service_client = TableServiceClient.from_connection_string(conn_str=connection_string)

    try:
        table_client = table_service_client.create_table(table_name=table_name)
    except ResourceExistsError:
        print("Table already exists. No need to create.")
        # get table
        table_client = table_service_client.get_table_client(table_name=table_name)

    return table_client

def get_ordered_table_results(table_client, my_filter, datetime_column='DateOfObservation'):

    """Gets ordered table results using a table client and filter."""

    previous_measurements = table_client.query_entities(my_filter)
    list_of_dict_observations = []
    for entity in previous_measurements:
        list_of_dict_observations.append(entity)

    table_df = None
    if list_of_dict_observations:
        table_df = pd.DataFrame.from_records(list_of_dict_observations)
        table_df.sort_values(by=datetime_column, inplace=True, ascending=True)
    
    return table_df