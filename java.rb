cheatsheet do
    title 'Java'
    docset_file_name 'Java'
    keyword 'java'
    category do
        id 'RxJava'
        entry do
            name 'Observable to list'
            notes <<-'END'
            ```
            Observable<T> obs = ...;
            List<T> l = obs.toList().toBlocking().single();
            ```
            END
        end
    end
    category do
        id 'Streams'
        entry do
            name 'List of maps to single map, clobbering duplicate keys'
            notes <<-'END'
            ```
            List<Map<String, Long>> input = ...;
            output = input.stream().reduce(new HashMap<>(), (x, y) -> {
                Map<String, Long> result = new HashMap<>(x);
                result.putAll(y);
                return result;
            });
            ```
            END
        end
    end

    category do
        id 'Mocking'
        entry do
            name 'Create mock object with method'
            notes <<-'END'
            ```
            import static org.mockito.Mockito.mock;
            import static org.mockito.Mockito.when;

            MyClass x = mock(MyClass.class);
            when(x.myFunc()).thenReturn("dummy value");
            ```
            END
        end
    end
end

