  // 解析入库
        List<BaseNeoDO> data = CollUtil.newArrayList();
        ExcelReader reader = ExcelUtil.getReader("/data-manager/excel/" + file.getOriginalFilename());
        log.info("【获取excel下sheet名字】:{}", reader.getSheetNames());

        // db
        executor.execute(RunnableForExcel.sendToKafka(reader,DbInfoExcelDTO.class,DbInfo.class,"Db",KafkaConsts.TOPIC_DB));
        List<DbInfoExcelDTO> dbDTOs = reader.setSheet("Db").read(0, 1, DbInfoExcelDTO.class);
        List<DbInfo> dbs = new ArrayList<>(dbDTOs.size());
        dbDTOs.forEach(o -> {
            DbInfo db = new DbInfo();
            BeanUtils.copy(o, db);
            dbs.add(db);
        });
        dbs.forEach(o -> kafkaTemplate.send(KafkaConsts.TOPIC_DB, JSONUtil.toJsonStr(o)));

        // table
        List<TableInfoExcelDTO> tableDTOs = reader.setSheet("Table").read(0, 1, TableInfoExcelDTO.class);
        List<TableInfo> tables = new ArrayList<>(tableDTOs.size());
        tableDTOs.forEach(o -> {
            TableInfo table = new TableInfo();
            BeanUtils.copy(o, table);
            tables.add(table);
        });
        dbs.forEach(o -> kafkaTemplate.send(KafkaConsts.TOPIC_TABLE, JSONUtil.toJsonStr(o)));

        // view
        List<ViewInfoExcelDTO> viewDTOs = reader.setSheet("View").read(0, 1, ViewInfoExcelDTO.class);
        List<ViewInfo> views = new ArrayList<>(viewDTOs.size());
        viewDTOs.forEach(o -> {
            ViewInfo view = new ViewInfo();
            BeanUtils.copy(o, view);
            views.add(view);
        });
        dbs.forEach(o -> kafkaTemplate.send(KafkaConsts.TOPIC_VIEW, JSONUtil.toJsonStr(o)));

        // column
        List<ColumnInfoExcelDTO> columnDTOs = reader.setSheet("Column").read(0, 1, ColumnInfoExcelDTO.class);
        List<ColumnInfo> columns = new ArrayList<>(columnDTOs.size());
        columnDTOs.forEach(o -> {
            ColumnInfo column = new ColumnInfo();
            BeanUtils.copy(o, column);
            columns.add(column);
        });
        dbs.forEach(o -> kafkaTemplate.send(KafkaConsts.TOPIC_COLUMN, JSONUtil.toJsonStr(o)));

        data.addAll(dbs);
        data.addAll(tables);
        data.addAll(views);
        data.addAll(columns);

        log.info("【解析成Json】:{}", JSONUtil.parseArray(data));

        return null;
