package com.daoyun.demo.Service.Impl;

@Service("dictionaryService")
public class DictionaryServiceImpl implements DictionaryService {
    @Autowired
    DictionaryRepository dictionaryRepository;


    @Override
    public Dictionary findById(Long id) {
        Optional<Dictionary> byId = dictionaryRepository.findById(id);
        if (!byId.isPresent()) {
            return null;
        }
        return byId.get();
    }

    @Override
    public List<Dictionary> findAll() {
        return dictionaryRepository.findAll();

    }

    @Override
    public Integer insert(Dictionary dictionary) {
        if (dictionary == null) {
            return 1;
        }
        dictionary.setCreateDate(new Date());
        dictionaryRepository.save(dictionary);
        return 0;
    }

    @Override
    public Integer Delete(Long id) {
        Dictionary dictionary = findById(id);
        if (dictionary == null) {
            return 1;
        }
        if (HttpContent.removeIngoreSet.contains(dictionary.getDataKey())) {
            return 2; 
        }
        dictionaryRepository.delete(dictionary);
        return 0;
    }

    @Override
    public Integer modify(Dictionary dictionary) {
        if (dictionary == null){
            return 1; 
        }
        dictionaryRepository.save(dictionary);
        return 0;
    }
}