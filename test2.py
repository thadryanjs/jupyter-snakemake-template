from pydantic import ValidationError, validate_call


class Config:
    strict = True


@validate_call(config=Config)
def test(a: int, b: int) -> int:
    return a + b


try:
    test(1, "1")
except ValidationError as e:
    print(e)

print("Done!")
