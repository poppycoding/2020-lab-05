        List<List<MetaRelationVO.Info>> groupInfos = CollUtil.group(infos, info -> HashUtil.apHash(info.getId()));
        groupInfos.forEach(o -> {
            if (o.size() == 1) {
                distinct.addAll(o);
            } else {
                distinct.add(CollUtil.getLast(CollUtil.sortByProperty(o, "level")));
            }
        });