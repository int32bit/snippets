import sqlalchemy

def query_db(logger, connection_string, query_string):
    try:
        engine = sqlalchemy.create_engine(connection_string)
        res = engine.execute(query_string).first()
    except sqlalchemy.exc.OperationalError as e:
        logger.critical("Operational error '%s'" % e)
    except sqlalchemy.exc.ProgrammingError as e:
        logger.critical("Programming error '%s'" % e)
    else:
        return res[0]
