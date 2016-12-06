cheatsheet do
    title 'Java'
    docset_file_name 'Java'
    keyword 'java'
    category do
        id 'RxJava'
        entry do
            name 'Observable to list'
            notes <<-'END'
            ```java
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
            ```java
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
            ```java
            import static org.mockito.Mockito.mock;
            import static org.mockito.Mockito.when;

            MyClass x = mock(MyClass.class);
            when(x.myFunc()).thenReturn("dummy value");
            ```
            END
        end
        entry do
            name 'Match any argument'
            notes <<-'END'
            ```java

            import static org.mockito.Mockito.mock;
            import static org.mockito.Matchers.any;

            when(x.foo(any())).thenReturn(12);

            ```
            END
        end
        entry do
            name 'Capture an argument'
            notes <<-'END'
            ```java
            import org.mockito.ArgumentCaptor;

            import static org.mockito.Mockito.mock;
            import static org.mockito.Mockito.when;

            // Setup
            Client client = mock(Client.class);
            Response response = mock(Response.class);

            // Argument capture logic here
            ArgumentCaptor<URI> url = ArgumentCaptor.forClass(URI.class);
            when(client.get(url.capture())).thenReturn(response);

            // Code under test, expects to call client.get
            myClass.doTheThing(client);

            assertEquals("http://www.example.com", url.getValue().toString());
            ```
            END
        end
        entry do
            name 'Unmock a single method'
            notes <<-'END'
            ```java
            import static org.mockito.Mockito.mock;

            when(mock.bar()).thenCallRealMethod();
            ```
            END
        end
    end
    category do
        id 'JSON'
        entry do
            name 'Populate JsonNode'
            notes <<-'END'
            ```java
            import org.codehaus.jackson.map.ObjectMapper;
            import org.codehaus.jackson.JsonNode;

            String json = "{\"foo\": 12}";

            JsonNode data = new ObjectMapper().readTree(json);
            ```
            END
        end
    end
    category do
        id 'Gradle'
        entry do
            name 'Execute from the command-line'
            notes <<-'END'
            In build.gradle

            ```groovy
            apply plugin: 'application'
            mainClassName = "org.example.packagename.MyClass"
            ```

            To execute:

            ```bash
            gradlew run
            ```

            END
        end
    end
end

