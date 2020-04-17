package com.daoyun.demo.Service.Impl;

@Service("dictionaryContentService")
public class DictionaryContentServiceImpl implements DictionaryContentService{
    @Autowired
    DictionaryContentRepository dictionaryContentRepository;

    @Override
    public DictionaryContent findById(Long id) {
        Optional<DictionaryContent> byId = dictionaryContentRepository.findById(id);
        if (!byId.isPresent()) {
            return null;
        }
        return byId.get();
    }

    @Override
    public Integer insert(DictionaryContent dictionaryContent) {
        if (dictionaryContent == null) {
            return 1; 
        }
        dictionaryContent.setCreateDate(new Date());
        dictionaryContentRepository.save(dictionaryContent);
        return 0;
    }

    @Override
    public Integer Delete(Long id) {
        DictionaryContent byId = findById(id);
        if (byId == null) {
            return 1;
        }
        if (HttpContent.removeIngoreSet.contains(byId.getContentKey())) {
            return 2; 
        }
        dictionaryContentRepository.delete(byId);
        return 0;
    }

    @Override
    public Integer modify(DictionaryContent dictionaryContent) {
        if (dictionaryContent == null) {
            return 1;
        }
        dictionaryContentRepository.save(dictionaryContent);
        return 0;
    }

    @Override
    public List<DictionaryContent> findDicContentByDicId(Long dicId) {
        List<DictionaryContent> dicContentByDicId = dictionaryContentRepository.findDicContentByDicId(dicId);
        return dicContentByDicId;
    }
}