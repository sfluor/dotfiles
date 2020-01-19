import json
from pathlib import Path
# TODO: env python

# TODO: allow to pass any file
# TODO: allow comments
with open("./themes/snazzy.json", "r") as f:
    theme = json.load(f)

FMT = "{{{{ {} }}}}"
def apply_theme(theme, content, prefix=''):

    for key, value in theme.items():
        new_prefix = key if not prefix else f'{prefix}.{key}'
        if isinstance(value, dict):
            content = apply_theme(value, content, prefix=new_prefix)
        else:
            content = content.replace(FMT.format(new_prefix), value)

    return content


p = Path(".")
templates = list(p.glob("**/*.tmpl"))

print("Found the following templates:", ', '.join([str(t) for t in templates]))

for template in templates:
    with template.open() as file:
        content = file.read()

    content = apply_theme(theme, content)

    # Remove .tmpl
    generated_path = str(template)[:-5]

    with open(generated_path, "w") as file:
        file.write(content)

    print(f"\t - generated {generated_path} from {str(template)}")
