using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using FluentAssertions;
using Moq;
using Pims.Core.Exceptions;
using Pims.Core.Test;
using Pims.Dal.Entities;
using Pims.Dal.Exceptions;
using Pims.Dal.Repositories;
using Pims.Dal.Security;
using Xunit;

namespace Pims.Dal.Test.Repositories
{
    [Trait("category", "unit")]
    [Trait("category", "dal")]
    [Trait("group", "financialcode")]
    [ExcludeFromCodeCoverage]
    public class H120CategoryRepositoryTest
    {
        // xUnit.net creates a new instance of the test class for every test that is run,
        // so any code which is placed into the constructor of the test class will be run for every single test.
        private readonly TestHelper _helper = new();

        private H120CategoryRepository CreateWithPermissions(params Permissions[] permissions)
        {
            var user = PrincipalHelper.CreateForPermission(permissions);
            _helper.CreatePimsContext(user, true);
            return _helper.CreateRepository<H120CategoryRepository>(user);
        }

        [Fact]
        public void GetAll_Success()
        {
            // Arrange
            var codeToAdd = new PimsH120Category()
            {
                H120CategoryId = 1,
                Description = "Bar",
            };
            var repository = CreateWithPermissions(Permissions.CompensationRequisitionView);
            _helper.AddAndSaveChanges(codeToAdd);

            // Act
            var result = repository.GetAll();

            // Assert
            result.Should().NotBeNull();
            result.Should().BeAssignableTo<IEnumerable<PimsH120Category>>();
            result.Should().HaveCount(1);
        }

        [Fact]
        public void Add_ThrowIfNotAuthorized()
        {
            // Arrange
            var repository = CreateWithPermissions(Permissions.SystemAdmin);

            // Act
            Action act = () => repository.GetAll();

            // Assert
            act.Should().Throw<NotAuthorizedException>();
        }
    }
}
