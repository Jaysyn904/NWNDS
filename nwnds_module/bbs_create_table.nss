#include "aps_include"

void main()
{
SQLExecDirect("DROP TABLE bbs");
SQLExecDirect("DROP TABLE bbs_stats");
SQLExecDirect("CREATE TABLE bbs (" +
                    "Tag varchar(64) NOT NULL default '',"+
                    "ID tinyint(4) NOT NULL default '0',"+
                    "Poster varchar(64) NOT NULL default '',"+
                    "Date varchar(64) NOT NULL default '',"+
                    "Title varchar(64) NOT NULL default '',"+
                    "Message text,"+
                    "PRIMARY KEY  (Tag,ID)) TYPE=MyISAM;");


SQLExecDirect("CREATE TABLE bbs_stats (" +
                    "Tag varchar(64) NOT NULL default '',"+
                    "Total smallint(3) NOT NULL default '0'," +
                    "Latest smallint(3) NOT NULL default '0'," +
                    "Lowest smallint(3) NOT NULL default '0'," +
                    "PRIMARY KEY (Tag)) TYPE=MyISAM;");

}
