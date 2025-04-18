"""Create sportsline table

Revision ID: e4d724aac5fc
Revises: 0353e12e6cdb
Create Date: 2024-10-28 13:56:50.221923

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'e4d724aac5fc'
down_revision = '0353e12e6cdb'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('sportsline',
    sa.Column('sportsline_id', sa.String(length=255), nullable=False),
    sa.Column('capper', sa.String(length=255), nullable=False),
    sa.Column('date', sa.DateTime(), nullable=False),
    sa.Column('league', sa.String(length=100), nullable=False),
    sa.Column('market', sa.String(length=100), nullable=False),
    sa.Column('event', sa.String(length=255), nullable=False),
    sa.Column('pick', sa.String(length=255), nullable=False),
    sa.Column('units', sa.Float(), nullable=False),
    sa.Column('result', sa.String(length=50), nullable=False),
    sa.Column('line', sa.Integer(), nullable=True),
    sa.Column('returns', sa.Float(), nullable=True),
    sa.PrimaryKeyConstraint('sportsline_id')
    )
    with op.batch_alter_table('sportsline', schema=None) as batch_op:
        batch_op.create_index('idx_capper', ['capper', 'league'], unique=False)

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('sportsline', schema=None) as batch_op:
        batch_op.drop_index('idx_capper')

    op.drop_table('sportsline')
    # ### end Alembic commands ###
