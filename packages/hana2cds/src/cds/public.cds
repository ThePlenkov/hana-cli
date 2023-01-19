using from './public/OBJECTS';
using TABLES from './public/TABLES';
using VIEWS from './public/VIEWS';
using VIEW_COLUMNS from './public/VIEW_COLUMNS';
using TABLE_COLUMNS from './public/TABLE_COLUMNS';

extend VIEWS with {
     columns : Association to many VIEW_COLUMNS
                    on  columns.SCHEMA_NAME = SCHEMA_NAME
                    and columns.VIEW_NAME   = VIEW_NAME;
};

extend TABLES with {
     columns : Association to many TABLE_COLUMNS
                    on  columns.SCHEMA_NAME = SCHEMA_NAME
                    and columns.TABLE_NAME  = TABLE_NAME;
};

extend OBJECTS with {
     table : Association to one TABLES
                  on  table.TABLE_OID = OBJECT_OID
                  and OBJECT_TYPE     = 'TABLE';
     view : Association to one VIEWS
                  on  view.VIEW_OID = OBJECT_OID
                  and OBJECT_TYPE     = 'VIEW';
}
