from pydantic import ValidationError, validate_call


@validate_call
def repeat(s: str, count: int, *, separator: bytes = b"") -> bytes:
    b = s.encode()
    return separator.join(b for _ in range(count))


@validate_call
def add(a: int, b: int) -> int:
    return a + b


@validate_call
def hello(name: str) -> str:
    return f"Hello, {name}!"


try:
    n = hello(123)
    x = add(1, 2)
except ValidationError as exc:
    print(exc)
